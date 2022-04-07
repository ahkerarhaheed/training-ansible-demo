# ATTACH THE INSTANCE PROFILE TO THE PUBLIC INSTANCE
resource "aws_instance" "my_public_server" {
  count = var.number_of_public_instances
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.talent-academy-public-a.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = var.my_keypair
  

tags = {
    Name = "web_server${count.index + 1}"
  }
}