# Cluster Vars
variable "name" {
  type        = string
  default     = "ecs"
  description = "description"
}

# Task Definitions Vars

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

# Service Vars
variable "region" {
  default     = "us-east-1"
  description = "description"
}
variable "replicas_count" {
  type        = number
  default     = 3
  description = "description"
}
variable "cluster_id" {
  type        = string
  default     = ""
  description = "Necessário passar um ARN de um Cluster, seja existente ou criado pelos resources do Terraform utilizando o output."
}
variable "task_definition_arn" {
  type        = string
  default     = ""
  description = "Necessário passar um ARN de um Task Definition, seja existente ou criado pelos resources do Terraform utilizando o output."
}

variable "dbname" {
    default = null
}
variable "dbpass"  {
    default = null
}

variable "usernamedb" {
    default = null
}

variable "server" {

  default = null
  
}