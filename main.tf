module "aws_vpc" {
  source       = "./modules/vpc"
  region       = var.region
  project_name = var.project_name
  user         = var.user

  vpc_parameters = {
    cidr_block = var.vpc_parameters.cidr_block
  }
  
  subnet_public_parameters  = var.subnet_public_parameters
  subnet_private_parameters = var.subnet_private_parameters

}

module "nat_gw" {
  source            = "./modules/nat-gw"
  vpc_id            = module.aws_vpc.vpc_id
  subnet_public_id  = module.aws_vpc.subnet_public_id
  subnet_private_id = module.aws_vpc.subnet_private_id
  internet_gateway  = module.aws_vpc.internet_gateway

}

module "acl" {
  source            = "./modules/acl"
  vpc_id            = module.aws_vpc.vpc_id
  subnet_public_id  = module.aws_vpc.subnet_public_id
  subnet_private_id = module.aws_vpc.subnet_private_id

  public_acl_rules = {
    for acl_name, acl_config in var.public_acl_rules :
    acl_name => {
      rule_number = acl_config.rule_number
      egress      = acl_config.egress
      protocol    = acl_config.protocol
      rule_action = acl_config.rule_action
      cidr_block  = acl_config.cidr_block
      from_port   = acl_config.from_port
      to_port     = acl_config.to_port
    }
  }

  private_acl_rules = {
    for acl_name, acl_config in var.private_acl_rules :
    acl_name => {
      rule_number = acl_config.rule_number
      egress      = acl_config.egress
      protocol    = acl_config.protocol
      rule_action = acl_config.rule_action
      cidr_block  = acl_config.cidr_block
      from_port   = acl_config.from_port
      to_port     = acl_config.to_port
    }
  }
}


