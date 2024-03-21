output "vpc_id" {
  value = aws_vpc.this.id
  description = "Export the VPC ID"
}

output "subnet_public_id" {
  value       = [for s in aws_subnet.public : s.id]
  description = "Export a list of the public subnets IDs"
}

# Export a list of the private subnets IDs
output "subnet_private_id" {
  value       = [for s in aws_subnet.private : s.id]
  description = "Export a list of the private subnets IDs"
}

output "internet_gateway" {
    value = aws_internet_gateway.this
    description = "Export the interenet gateway"
}
