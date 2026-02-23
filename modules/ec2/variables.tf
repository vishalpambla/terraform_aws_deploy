variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of EC2 key pair"
  type        = string
}

variable "security_group_name" {
  description = "Name for EC2 Security Group"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
