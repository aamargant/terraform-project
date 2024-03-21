variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_public_id" {
  description = "Public subnet IDs"
}

variable "subnet_private_id" {
  description = "Private subnet IDs"
}

variable "public_acl_rules" {
  description = "Public ACL rules"
}

variable "private_acl_rules" {
  description = "Private ACL rules"
}