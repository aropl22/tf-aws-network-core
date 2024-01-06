# Deploys AWS network core using Terraform

The code deployes a network core on AWS:

-VPC
-Public Subnet
-Internet Gateway
-Route Table
-Security Group

Must define backend and AWS access keys
Terraform defaults to using the local backend, which stores state as a plain file in the current working directory.

More info:
https://developer.hashicorp.com/terraform/language/settings/backends/configuration

## Examples:

### Terraform Cloud backend file

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }

  cloud {
    organization = "YOUR ORGANIZATION NAME"

    workspaces {
      name = "YOUR WORKSPACE NAME"
    }
  }
}

### Local Backend

terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}

## Terraform variable definitions (.tfvars) files

To set lots of variables, it's more convenient to specify their values in a variable definitions file (.tfvars or .tfvars.json)
and then specify that file on the command line with -var-file

### Example (terraform.tfvars):

region = "us-west-1" #AWS region

vpc_name = "VPC 1" # AWS VPC name

vpc_cidr_block = "10.100.200.0/23" # AWS VPC subnet CIDR

subnet_cidr_block = "10.100.200.0/24" #AWS subnet CIDR

subnet_name = "Public Subnet" #AWS subnet Name

availability_zone = "us-west-1b" # AWS availability zone

sgroup_remote_rules = [
  {
    port_from         = 8,
    port_to           = 0,
    protocol          = "icmp"
    remote_cidr_block = "8.8.8.8/32"
  },
   {
    port_from = 22,
    port_to   = 22,
    protocol  = "tcp"
   remote_cidr_block = "YOUR PUBLIC IP ADDRESS"
    }
]
