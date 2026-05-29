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
    internal = var.FRONTEND_INTERNAL_PORT
    external = var.FRONTEND_EXTERNAL_PORT
  }

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}
