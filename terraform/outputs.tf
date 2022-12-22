output "ec2instance" {
  value = aws_instance.ec2-dev.public_ip
}