# Criando recurso para a imagem do Prometheus
resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

# Criando recurso para o container do Prometheus
resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = docker_image.prometheus.image_id

  ports {
    internal = var.PROMETHEUS_INTERNAL_PORT
    external = var.PROMETHEUS_EXTERNAL_PORT
  }

  upload {
    file    = "/etc/prometheus/prometheus.yml"
    content = file("${path.module}/../monitoring/prometheus.yml")
  }

  networks_advanced {
    name = docker_network.devops_network.name
  }

  restart = "always"
}