
# Task Definitions Vars
variable "environment" {
  default = []
}

variable "region" {
  default     = "us-east-1"
  description = "description"
}

variable "container_name" {
  default = ""
}

variable "container_image" {
  default = ""
}

variable "container_cpu" {
  type    = number
  default = 10
}

variable "container_memory" {
  type    = number
  default = 512
}

variable "container_essential" {
  default = true
}

variable "container_port" {
  default = 8080
}

variable "container_host_port" {
  default = 80
}

variable "dbname" {

  type = string
  description = "Name database"
  default = null
  
}

variable "usernamedb" {
  type = string
  description = "Username Database"
  default = null
}


variable "dbpass" {
  type = string
  description = "Senha db"
  default = null  
}


variable "server" {
  
  default = null
  
}

