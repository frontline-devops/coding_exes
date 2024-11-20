# 1. Run the following Terraform and walk through what it is creating
# 2. Create a module that will allow us to specify the image name and external port

terraform {
 required_providers {
   docker = {
     source = "kreuzwerker/docker"
     version = "~> 3.0.1"
   }
 }
}

provider "docker" {}

resource "docker_image" "nginx" {
 name        = "nginx"
 keep_locally = false
}

resource "docker_container" "nginx" {
 image = docker_image.nginx.image_id
 name = "tutorial"

 ports {
   internal = 80
   external = 8000
 }
}
