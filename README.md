# Desafio Técnico Cubos DevOps - Terraform + Docker + Monitoring

## 📌 Sobre o Projeto

Este projeto foi desenvolvido como solução para um desafio técnico DevOps.

O objetivo foi construir uma aplicação containerizada contendo:

* Frontend
* Backend
* Banco PostgreSQL
* Monitoramento com Prometheus e Grafana
* Provisionamento automatizado com Terraform

Toda a infraestrutura é provisionada localmente utilizando Docker Provider no Terraform.

---

# 🏗️ Arquitetura

```text
Terraform
   ↓
Docker Provider
   ↓
Containers:
- frontend
- backend
- postgres
- prometheus
- grafana
- node-exporter
```

---

# 🚀 Tecnologias Utilizadas

## Infraestrutura

* Terraform
* Docker
* Docker Network
* Docker Volumes

## Backend

* Node.js
* PostgreSQL

## Frontend

* HTML
* JavaScript

## Observabilidade

* Prometheus
* Grafana
* Node Exporter

---

# 📁 Estrutura do Projeto

```text
desafio-cubos-devops/
│
├── backend/
│   ├── Dockerfile
│   ├── index.js
│   └── package.json
│
├── frontend/
│   ├── Dockerfile
│   └── index.html
│
├── database/
│   └── script.sql
│
├── monitoring/
│   └── prometheus.yml
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   └── variables.tf
│
└── README.md
```

---

# ⚙️ Pré-requisitos

Antes de iniciar, é necessário possuir instalado:

* Docker
* Terraform
* Git

---

# 🔧 Como Executar o Projeto

## 1. Clone o repositório

```bash
git clone <URL_REPOSITORIO>
```

---

## 2. Acesse a pasta do Terraform

```bash
cd terraform
```

---

## 3. Inicialize o Terraform

```bash
terraform init
```

---

## 4. Provisionar infraestrutura

```bash
terraform apply -auto-approve
```

---

# 🌐 Serviços Disponíveis

| Serviço    | URL                       |
| ---------- | ------------------------- |
| Frontend   | http://localhost:5500     |
| Backend    | http://localhost:3000/api |
| Prometheus | http://localhost:9090     |
| Grafana    | http://localhost:3001     |

---

# 📊 Monitoramento

O monitoramento foi implementado utilizando:

* Prometheus
* Grafana
* Node Exporter

## Métricas Monitoradas

* CPU
* Memória
* Disco
* Rede
* Uptime

---

# 📈 Dashboard Grafana

Dashboard utilizado:

```text
1860 - Node Exporter Full
```

Login padrão Grafana:

```text
admin
admin
```

---

# 🗄️ Banco de Dados

O banco PostgreSQL é inicializado automaticamente pelo Terraform.

Tabela criada:

```sql
users
```

Usuário padrão:

```text
username: admin
role: admin
```

---

# 🐳 Containers Provisionados

* frontend
* backend
* postgres
* prometheus
* grafana
* node-exporter

---

# 🔥 Recursos DevOps Aplicados

* Infrastructure as Code (IaC)
* Containerização
* Observabilidade
* Redes Docker
* Persistência com Volumes
* Automação com Terraform
* Provisionamento automatizado

---

# 🛠️ Troubleshooting

## Verificar containers

```bash
docker ps
```

---

## Logs do backend

```bash
docker logs backend
```

---

## Logs do PostgreSQL

```bash
docker logs postgres
```

---

## Destruir infraestrutura

```bash
terraform destroy -auto-approve
```

---

# 📌 Melhorias Futuras

* Kubernetes
* CI/CD com GitHub Actions
* Deploy em Cloud
* Monitoramento da aplicação
* Alertas no Grafana
* Reverse Proxy com Nginx

---
