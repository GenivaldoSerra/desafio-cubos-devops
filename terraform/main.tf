resource "docker_network" "devops_network" {
  name = "devops-network"
}

resource "docker_volume" "postgres_data" {
  name = "postgres_data"
}

# Criando imagem do Backend
resource "docker_image" "backend" {
  name = "backend-app:latest"

  build {
    context  = "../backend"
    no_cache = true
  }
}

# Criando container do Backend
resource "docker_container" "backend" {
  name  = "backend"
  image = docker_image.backend.image_id

  depends_on = [
    null_resource.database_init
  ]

  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "PORT=3000",
    "DB_HOST=postgres",
    "DB_PORT=5432",
    "DB_NAME=cubos_devops",
    "DB_USER=admin",
    "DB_PASSWORD=admin"
  ]

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}

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
    "POSTGRES_DB=cubos_devops",
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin"
  ]

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}

# Criando imagem do Frontend
resource "docker_image" "frontend" {
  name = "frontend-image"

  build {
    context = "${path.module}/../frontend"
  }
}

# Criando container do Frontend
resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = 5500
  }

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
        docker exec postgres pg_isready -U admin -d cubos_devops && break
        echo "Tentativa $i/30 - aguardando..."
        sleep 2
      done

      echo "Criando tabela users..."
      docker exec postgres psql \
        -U admin \
        -d cubos_devops \
        -c "CREATE TABLE IF NOT EXISTS users (
          id SERIAL PRIMARY KEY,
          username VARCHAR(50) NOT NULL,
          password VARCHAR(255) NOT NULL,
          role VARCHAR(20) NOT NULL
        );"

      echo "Inserindo usuário admin..."
      docker exec postgres psql \
        -U admin \
        -d cubos_devops \
        -c "INSERT INTO users (username, password, role)
            VALUES ('admin', 'secure_p4\$\$w0rd', 'admin')
            ON CONFLICT DO NOTHING;"

      echo "Banco inicializado com sucesso."
    EOT
  }
}