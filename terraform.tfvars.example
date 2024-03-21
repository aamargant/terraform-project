vpc_parameters = {
  cidr_block = "10.0.0.0/16"
}

subnet_public_parameters = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

subnet_private_parameters = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

public_acl_rules = {
  allow_all_inegress = {
    rule_number = "9999"
    egress      = false
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
  allow_all_egress = {
    rule_number = "9999"
    egress      = true
    protocol    = "-1"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
}

private_acl_rules = {
  allow_ssh_ingress = {
    rule_number = "102"
    egress      = false
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 22
    to_port     = 22
  }
  allow_https_ingress = {
    rule_number = "103"
    egress      = false
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
  allow_ssh_egress = {
    rule_number = "102"
    egress      = true
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 22
    to_port     = 22
  }
  allow_https_egress = {
    rule_number = "103"
    egress      = true
    protocol    = "tcp"
    rule_action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
  deny_all_ingress = {
    rule_number = "9999"
    egress      = false
    protocol    = "-1"
    rule_action = "deny"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
  deny_all_egress = {
    rule_number = "9999"
    egress      = true
    protocol    = "-1"
    rule_action = "deny"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
  deny_all_egress = {
    rule_number = "9999"
    egress      = true
    protocol    = "-1"
    rule_action = "deny"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
}
