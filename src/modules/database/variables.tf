variable "db_name" {
  type        = string
  description = "The name of the database"
  default     = "petik-go-db"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance"
  default     = "iac-db-instance"
}

variable "region" {
  type        = string
  description = "The region to create things in"
}

variable "network" {
  type        = string
  description = "The network to create things in"
}

variable "network_private_connection" {
  type        = string
  description = "The network to create things in"
}