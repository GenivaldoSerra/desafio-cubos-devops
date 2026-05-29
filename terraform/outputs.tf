output "container_frontend" {
  value = docker_container.frontend.name
}

output "container_backend" {
  value = docker_container.backend.name
}

output "network" {
  value = docker_network.devops_network.name
}

output "volume" {
  value = docker_volume.postgres_data.name
}

output "container_grafana" {
  value = docker_container.grafana.name
}

output "container_prometheus" {
  value = docker_container.prometheus.name
}

output "container_node_exporter" {
  value = docker_container.node_exporter.name
}