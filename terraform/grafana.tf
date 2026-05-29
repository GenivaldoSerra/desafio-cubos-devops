# Imagem Grafana
resource "docker_image" "grafana" {
  name = "grafana/grafana"
}

# Container Grafana
resource "docker_container" "grafana" {
  name  = "grafana"
  image = docker_image.grafana.image_id

  ports {
    internal = var.GRAFANA_INTERNAL_PORT
    external = var.GRAFANA_EXTERNAL_PORT
  }

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}