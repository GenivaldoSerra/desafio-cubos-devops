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
# ⚙️ Pré-requisitos

Antes de executar o projeto, é necessário possuir as seguintes ferramentas instaladas:

* Docker Desktop
* Terraform
* Git

---

# 🪟 Windows

## Instalar Docker Desktop

1. Baixe o instalador oficial:

```text
https://www.docker.com/products/docker-desktop/
```

2. Durante a instalação:

* habilite o WSL2
* reinicie o computador se solicitado

3. Verifique a instalação:

```powershell
docker --version
```

---

## Instalar Terraform

1. Baixe o binário oficial:

```text
https://developer.hashicorp.com/terraform/downloads
```

2. Extraia o arquivo `.zip`

3. Adicione o executável ao `PATH`

4. Verifique:

```powershell
terraform --version
```

---

## Instalar Git

Download oficial:

```text
https://git-scm.com/download/win
```

Verifique:

```powershell
git --version
```

---

# 🐧 Ubuntu / Linux

## Atualizar repositórios

```bash
sudo apt update && sudo apt upgrade -y
```

---

## Instalar Docker

### Remover versões antigas

```bash
sudo apt remove docker docker-engine docker.io containerd runc
```

---

### Instalar dependências

```bash
sudo apt install -y \
ca-certificates \
curl \
gnupg \
lsb-release
```

---

### Adicionar chave GPG oficial

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

---

### Adicionar repositório Docker

```bash
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

---

### Instalar Docker Engine

```bash
sudo apt update

sudo apt install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin
```

---

### Adicionar usuário ao grupo docker

```bash
sudo usermod -aG docker $USER
```

Depois faça logout/login novamente.

---

### Validar instalação

```bash
docker --version
docker compose version
```

---

## Instalar Terraform

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

---

```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

---

```bash
sudo apt update && sudo apt install terraform -y
```

---

### Validar instalação

```bash
terraform --version
```

---

## Instalar Git

```bash
sudo apt install git -y
```

---

### Validar instalação

```bash
git --version
```

---

# 🍎 macOS

## Instalar Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## Instalar Docker Desktop

Download oficial:

```text
https://www.docker.com/products/docker-desktop/
```

---

### Validar instalação

```bash
docker --version
```

---

## Instalar Terraform

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

---

### Validar instalação

```bash
terraform --version
```

---

## Instalar Git

```bash
brew install git
```

---

### Validar instalação

```bash
git --version
```

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
