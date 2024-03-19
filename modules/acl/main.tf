resource "aws_network_acl" "public" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_public_id
  tags = {
    Name = "Public network access control list"
  }
}

resource "aws_network_acl" "private" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_private_id
  tags = {
    Name = "Private network access control list"
  }
}


resource "aws_network_acl_rule" "public" {
  for_each = var.public_acl_rules

  network_acl_id = aws_network_acl.public.id

  rule_number = each.value.rule_number
  egress      = each.value.egress
  protocol    = each.value.protocol
  rule_action = each.value.rule_action
  cidr_block  = each.value.cidr_block
  from_port   = each.value.from_port
  to_port     = each.value.to_port
}

resource "aws_network_acl_rule" "private" {
  for_each = var.private_acl_rules

  network_acl_id = aws_network_acl.private.id

  rule_number = each.value.rule_number
  egress      = each.value.egress
  protocol    = each.value.protocol
  rule_action = each.value.rule_action
  cidr_block  = each.value.cidr_block
  from_port   = each.value.from_port
  to_port     = each.value.to_port
}

