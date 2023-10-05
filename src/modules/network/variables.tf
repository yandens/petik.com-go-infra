variable "network_name" {
  type        = string
  description = "The name of the network"
  default     = "vpc-petik"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "vpc-petik-subnet"
}

variable "egress_name" {
  type        = string
  description = "The name of the egress"
  default     = "vpc-petik-egress"
}

variable "router_name" {
  type        = string
  description = "The name of the router"
  default     = "vpc-petik-router"
}

variable "nat_name" {
  type        = string
  description = "The name of nat"
  default     = "vpc-petik-nat"
}

variable "region" {
  type        = string
  description = "The region of the network"
}

variable "private_ip_block_name" {
  type        = string
  description = "The name of the private ip block"
  default     = "vpc-petik-private-ip-block"
}