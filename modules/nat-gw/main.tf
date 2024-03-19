# Allocate Elastic IP. (This EIP will be used for the Nat-Gateway in the Public Subnet AZ1)
resource "aws_eip" "this" {
  count = length(var.subnet_public_id)
  domain    = "vpc"

  tags   = {
    Name = "eips-${count.index}"
  }
}

resource "aws_nat_gateway" "this" {
  count = length(var.subnet_public_id)
  allocation_id = aws_eip.this[count.index].id
  subnet_id     = var.subnet_public_id[count.index]

  tags   = {
    Name = "nat-gw-${count.index}"
  }

  depends_on = [var.internet_gateway]
}

resource "aws_route_table" "this" {
  count = length(aws_nat_gateway.this)
  vpc_id            = var.vpc_id
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.this[count.index].id
  }

  tags   = {
    Name = "nat-gw-route-${count.index}"
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.subnet_private_id)
  subnet_id         = var.subnet_private_id[count.index]
  route_table_id    = aws_route_table.this[count.index].id
}