variable "vpc_parameters" {
  description = "VPC parameters"
  type = object({
    cidr_block           = string
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, true)
  })
  default = {
    cidr_block  = "10.0.0.0/16"
  }
}

variable "subnet_public_parameters" {
  description = "Public subnet parameters"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_private_parameters" {
  description = "Private subnet parameters"
  type = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}