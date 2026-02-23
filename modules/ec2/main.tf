resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated" {
  key_name   = "${var.instance_name}-key"
  public_key = tls_private_key.generated.public_key_openssh
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_security_group" "ec2_sg" {
  name   = "${var.instance_name}-sg"
  vpc_id = data.aws_subnet.selected.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.allowed_ssh_cidr
  }
}

resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = aws_key_pair.generated.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  depends_on             = [aws_security_group.ec2_sg]
  tags                   = { Name = var.instance_name }
}


# Output the private key to use in CI/CD
output "private_key" {
  description = "Private key content for SSH access"
  value       = tls_private_key.generated.private_key_pem
  sensitive   = true
}
