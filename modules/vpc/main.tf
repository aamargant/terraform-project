data "aws_availability_zones" "available_zones" {}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_parameters.cidr_block
  enable_dns_support   = var.vpc_parameters.enable_dns_support
  enable_dns_hostnames = var.vpc_parameters.enable_dns_hostnames
  
  tags = {
    Name : "aws-vpc-test"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.subnet_public_parameters)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_public_parameters[count.index]
  availability_zone = element(data.aws_availability_zones.available_zones.names, count.index)
  
  tags = {
    Name : "aws-public-subnet-${element(data.aws_availability_zones.available_zones.names, count.index)}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.subnet_private_parameters)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_private_parameters[count.index]
  availability_zone = element(data.aws_availability_zones.available_zones.names, count.index)
  
  tags = {
    Name : "aws-private-subnet-${element(data.aws_availability_zones.available_zones.names, count.index)}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name : "aws-internet-gw"
  }
}

resource "aws_route_table" "this" {
  vpc_id   = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name : "aws-routing-table"
  }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public, count.index).id
  route_table_id = aws_route_table.this.id
}
