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

variable "subnet_cidr_block" {
  description = "subnet block"
  type        = string
  default     = "10.100.200.0/24"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "Public Subnet"
}

variable "subnet2_cidr_block" {
  description = "subnet block"
  type        = string
  default     = "10.100.201.0/24"
}

variable "subnet2_name" {
  description = "Subnet name"
  type        = string
  default     = "Private Subnet"
}

variable "availability_zone" {
  description = "AZ"
  type        = string
  default     = "us-west-1b"
}

variable "sgroup_remote_rules" {
  type = list(object({
    port_from         = number
    port_to           = number
    protocol          = string
    remote_cidr_block = string
  }))
}