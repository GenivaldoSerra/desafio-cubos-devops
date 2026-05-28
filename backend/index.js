import http from 'http';
import PG from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const port = Number(process.env.PORT);

const client = new PG.Client(
    //`postgres://${user}:${pass}@${host}:${db_port}` linha com erro, pois falta o nome do banco de dados no final da string de conexão
    `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`
);

let successfulConnection = false;

http.createServer(async (req, res) => {
    console.log(`Request: ${req.url}`);

    if (req.url === "/api") {
        client.connect()
            .then(() => { successfulConnection = true })
            .catch(err => console.error('Database not connected -', err.stack));

        res.setHeader("Content-Type", "application/json");
        res.writeHead(200);

        let result;

        try {
            result = (await client.query("SELECT * FROM users")).rows[0];
        } catch (error) {
            console.error(error)
        }

        const data = {
            database: successfulConnection,
            userAdmin: result?.role === "admin"
        }

        res.end(JSON.stringify(data));
    } else {
        res.writeHead(503);
        res.end("Internal Server Error");
    }

}).listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});