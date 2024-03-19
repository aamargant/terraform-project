
# Export the VPC ID
output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_public_id" {
  value       = [for s in aws_subnet.public : s.id]
  description = "A map of all resource group values."
}

output "subnet_private_id" {
  value       = [for s in aws_subnet.private : s.id]
  description = "A map of all resource group values."
}

output "internet_gateway" {
    value = aws_internet_gateway.this
}
