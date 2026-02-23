aws_region = "ap-south-1"

vpc_cidr = "10.0.0.0/16"

vpc_name = "dev"

public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

availability_zones = ["ap-south-1a", "ap-south-1b"]

instance_name       = "dev-ec2"
instance_type       = "t3.micro"
ami                 = "ami-0c91e3f0ba849e5cc"
key_name            = "dev-ec2-key"
security_group_name = "dev-ec2-sg"
env                 = "dev"
