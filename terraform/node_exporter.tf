# Imagem Node Exporter
resource "docker_image" "node_exporter" {
  name = "prom/node-exporter"
}

# Container Node Exporter
resource "docker_container" "node_exporter" {
  name  = "node-exporter"
  image = docker_image.node_exporter.image_id

  ports {
    internal = var.NODE_EXPORTER_INTERNAL_PORT
    external = var.NODE_EXPORTER_EXTERNAL_PORT
  }

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}