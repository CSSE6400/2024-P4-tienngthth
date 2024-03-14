resource "aws_instance" "hextris-server" {
  ami             = "ami-0e731c8a588258d0d"
  instance_type   = "t2.micro"
  key_name        = "vockey"
  user_data       = file("./serve-hextris.sh")
  security_groups = [aws_security_group.hextris-server.name]
  tags = {
    Name = "hextris"
  }
}

output "hextris-url" {
  value = aws_instance.hextris-server.public_ip
}
