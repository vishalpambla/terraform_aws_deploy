provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  env                = var.env
}

module "ec2" {
  source = "../../modules/ec2"

  instance_name       = var.instance_name
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet_ids[0] # better than hardcoding
  ami                 = var.ami
  key_name            = var.key_name
  security_group_name = var.security_group_name
}

output "instance_name" {
  value = module.ec2.instance_name
}

output "private_key" {
  value     = module.ec2.private_key
  sensitive = true
}
