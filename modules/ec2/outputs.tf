output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "instance_name" {
  description = "Name of the EC2 instance"
  value       = aws_instance.ec2.tags["Name"]
}

output "private_key" {
  description = "Private key content for SSH access"
  value       = tls_private_key.generated.private_key_pem
  sensitive   = true
}
