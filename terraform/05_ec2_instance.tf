resource "aws_instance" "ec2-dev" {
  # Creates four identical aws ec2 instances
  count = 4

  ami = "ami-0574da719dca65348"
  instance_type = "t2.nano"
  subnet_id = aws_subnet.public-subnet.id
  associate_public_ip_address = true
  key_name = aws_key_pair.production.key_name

	user_data = <<EOF
		#! /bin/bash
    sudo apt update
		sudo apt install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF

  # sudo add-apt-repository ppa:deadsnakes/ppa
  # sudo apt update 
  # sudo apt install python3.11

  	# sudo apt install gnupg2 software-properties-common apt-transport-https wget
    # wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    # sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    # sudo apt install code
		# sudo apt-get install -y apache2
		# sudo systemctl start apache2
		# sudo systemctl enable apache2
    # sudo add-apt-repository ppa:deadsnakes/ppa
    # sudo apt update 
    # sudo apt install python3.11

  vpc_security_group_ids = [
    aws_security_group.ec2-scg.id
  ]

  # root_block_device {
  #   delete_on_termination = true
  #   iops = 150
  #   volume_size = 50
  #   volume_type = "gp2"
  # }

  # Name ="SERVER01"
  tags = {
    Name = "my-machine-${count.index}"
    Environment = "DEV"
    OS = "UBUNTU"
    Managed = "IAC"
  }

  depends_on = [ aws_security_group.ec2-scg ]
}
