variable "region" {
  type        = string
  description = "AWS Region"
  default     = null
}

variable "rds_vpc_db_id" {
  type        = string
  description = "VPC rede  DEV"
  default     = null
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