variable "region" {}
variable "project_name" {}
variable "user" {}

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
  description = "Subnet parameters"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_private_parameters" {
  description = "Subnet parameters"
  type = list(string)
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "public_acl_rules" {
  description = "Public ACL rules"
  type = map(object({
    rule_number = string
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = {}
}

variable "private_acl_rules" {
  description = "Private ACL rules"
  type = map(object({
    rule_number = string
    egress      = bool
    protocol    = string
    rule_action = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default = {}
}