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
    internal = var.BACKEND_PORT
    external = var.BACKEND_PORT
  }

  env = [
    "PORT=${var.BACKEND_PORT}",
    "DB_HOST=${var.DB_HOST}",
    "DB_PORT=${var.DB_PORT}",
    "DB_NAME=${var.DB_NAME}",
    "DB_USER=${var.DB_USER}",
    "DB_PASSWORD=${var.DB_PASSWORD}"
  ]

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}