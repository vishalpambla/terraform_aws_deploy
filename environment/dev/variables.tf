variable "aws_region" {}

variable "vpc_cidr" {}

variable "vpc_name" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "instance_type" {}

variable "instance_name" {}
variable "ami" {}
variable "key_name" {}
variable "security_group_name" {}

variable "env" {
  description = "Environment name"
  type        = string
}
