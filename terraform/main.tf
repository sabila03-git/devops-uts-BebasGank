# Konfigurasi Terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

# Provider Docker
provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

# Resource: Pull image aplikasi kita
resource "docker_image" "app_image" {
  name         = "node:18-alpine"
  keep_locally = false
}

# Resource: Container Redis (untuk caching)
resource "docker_container" "redis" {
  name  = "redis-devops-uts"
  image = "redis:alpine"

  ports {
    internal = 6379
    external = 6379
  }

  restart = "unless-stopped"
}

# Resource: Container aplikasi web kita
resource "docker_container" "web_app" {
  name  = "webapp-devops-uts"
  image = docker_image.app_image.image_id

ports {
  internal = 3000
  external = 8081
}

  env = [
    "NODE_ENV=production",
    "PORT=3000"
  ]

  restart = "unless-stopped"
}

# Output informasi container
output "redis_container_name" {
  value       = docker_container.redis.name
  description = "Nama container Redis"
}

output "webapp_container_name" {
  value       = docker_container.web_app.name
  description = "Nama container Web App"
}