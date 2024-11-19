terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "my_image" {
  name         = var.docker_image
  keep_locally = false
}

resource "docker_container" "my_container" {
  image = docker_image.my_image.image_id
  name  = var.container_name

  ports {
    internal = 80
    external = 8000
  }
}
