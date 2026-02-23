output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "private_key_pem" {
  value     = tls_private_key.generated.private_key_pem
  sensitive = true
}
