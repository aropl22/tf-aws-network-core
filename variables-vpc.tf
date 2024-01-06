variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "VPC1"
}

variable "vpc_cidr_block" {
  description = "VPC block"
  type        = string
  default     = "10.100.200.0/23"
}

variable "my_subnets" {
  description = "Subnets for VPC"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
}

variable "sgroup_remote_rules" {
  type = list(object({
    port_from         = number
    port_to           = number
    protocol          = string
    remote_cidr_block = string
  }))
}