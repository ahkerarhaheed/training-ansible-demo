# ATTACH THE INSTANCE PROFILE TO THE PUBLIC INSTANCE
resource "aws_instance" "web_servers" {
  count                  = 4
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = var.my_keypair

  tags = {
    Name = "ansible_web_server_${count.index + 1}"
  }
}