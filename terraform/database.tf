# Criando imagem do PostgreSQL
resource "docker_image" "postgres" {
  name = "postgres:15.8"
}

# Criando container do PostgreSQL
resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.image_id

  ports {
    internal = 5432
    external = 5432
  }

  # Adicionado o mount do volume
  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  env = [
    "POSTGRES_DB=${var.DB_NAME}",
    "POSTGRES_USER=${var.DB_USER}",
    "POSTGRES_PASSWORD=${var.DB_PASSWORD}"
  ]

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}

# Executando script de inicialização do banco de dados
resource "null_resource" "database_init" {

  depends_on = [
    docker_container.postgres
  ]

  # Trigger garante re-execução se o container recriar
  triggers = {
    postgres_container_id = docker_container.postgres.id
  }

  provisioner "local-exec" {

    command = <<EOT
      echo "Aguardando PostgreSQL ficar pronto..."
      for i in $(seq 1 30); do
        docker exec postgres pg_isready -U ${var.DB_USER} -d ${var.DB_NAME} && break
        echo "Tentativa $i/30 - aguardando..."
        sleep 2
      done

      echo "Criando tabela users..."
      docker exec postgres psql \
        -U ${var.DB_USER} \
        -d ${var.DB_NAME} \
        -c "CREATE TABLE IF NOT EXISTS users (
          id SERIAL PRIMARY KEY,
          username VARCHAR(50) NOT NULL,
          password VARCHAR(255) NOT NULL,
          role VARCHAR(20) NOT NULL
        );"

      echo "Inserindo usuário admin..."
      docker exec postgres psql \
        -U ${var.DB_USER} \
        -d ${var.DB_NAME} \
        -c "INSERT INTO users (username, password, role)
            VALUES ('admin', 'secure_p4\$\$w0rd', 'admin')
            ON CONFLICT DO NOTHING;"

      echo "Banco inicializado com sucesso."
    EOT
  }
}