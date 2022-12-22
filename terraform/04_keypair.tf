resource "aws_key_pair" "production" {
  key_name   = "ec2_key_pair"
  public_key = file("./sshkey.pub")
}