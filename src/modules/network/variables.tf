variable "network_name" {
  type        = string
  description = "The name of the network"
  default     = "vpc-iac"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet"
  default     = "vpc-iac-subnet"
}

variable "egress_name" {
  type        = string
  description = "The name of the egress"
  default     = "vpc-iac-egress"
}

variable "router_name" {
  type        = string
  description = "The name of the router"
  default     = "vpc-iac-router"
}

variable "nat_name" {
  type        = string
  description = "The name of nat"
  default     = "vpc-iac-nat"
}

variable "region" {
  type        = string
  description = "The region of the network"
}

variable "private_ip_block_name" {
  type        = string
  description = "The name of the private ip block"
  default     = "vpc-iac-private-ip-block"
}