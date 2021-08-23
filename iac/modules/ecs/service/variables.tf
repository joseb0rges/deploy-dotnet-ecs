variable "name" {
  type        = string
  default     = ""
  description = "description"
}

variable "region" {
  default     = "us-east-1"
  description = "description"
}

variable "replicas_count" {
  type        = number
  default     = 3
  description = "description"
}

variable "container_name" {
  type        = string
  default     = ""
  description = "description"
}

variable "container_port" {
  type        = number
  default     = 8080
  description = "description"
}

variable "cluster_id" {
  type        = string
  default     = ""
  description = "description"
}

variable "task_definition_arn" {
  type        = string
  default     = ""
  description = "description"
}