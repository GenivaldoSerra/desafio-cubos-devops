# Variáveis para configuração do banco de dados, backend e frontend
variable "DB_PORT" {
  type        = number
  description = "Porta do banco de dados PostgreSQL"
  default     = 5432
}


variable "DB_HOST" {
  type        = string
  description = "Host do banco de dados PostgreSQL"
  default     = "postgres"
}

variable "DB_NAME" {
  type        = string
  description = "Nome do banco de dados PostgreSQL"
}

variable "DB_USER" {
  type        = string
  description = "Usuário do banco de dados PostgreSQL"
}

variable "DB_PASSWORD" {
  type        = string
  description = "Senha do banco de dados PostgreSQL"
}

variable "BACKEND_PORT" {
  type        = number
  description = "Porta do backend"
  default     = 3000
}

variable "FRONTEND_EXTERNAL_PORT" {
  type        = number
  description = "Porta do frontend"
  default     = 5500
}

variable "FRONTEND_INTERNAL_PORT" {
  type        = number
  description = "Porta interna do frontend"
  default     = 80
}

# Variáveis para configuração do Grafana, Prometheus e node_exporter

variable "GRAFANA_EXTERNAL_PORT" {
  type        = number
  description = "Porta do Grafana"
  default     = 3001
}

variable "GRAFANA_INTERNAL_PORT" {
  type        = number
  description = "Porta interna do Grafana"
  default     = 3000
}

variable "PROMETHEUS_EXTERNAL_PORT" {
  type        = number
  description = "Porta do Prometheus"
  default     = 9090
}

variable "PROMETHEUS_INTERNAL_PORT" {
  type        = number
  description = "Porta interna do Prometheus"
  default     = 9090
}

variable "NODE_EXPORTER_EXTERNAL_PORT" {
  type        = number
  description = "Porta do Node Exporter"
  default     = 9100
}

variable "NODE_EXPORTER_INTERNAL_PORT" {
  type        = number
  description = "Porta interna do Node Exporter"
  default     = 9100
}
