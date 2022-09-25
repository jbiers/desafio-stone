data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name    = "name"
    values  = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = [ "099720109477" ]
}

resource "aws_instance" "hello-stone" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "key"

  tags = {
    Name = "hello-stone"
  }

  vpc_security_group_ids = [
		"${aws_security_group.allow_ssh.id}",
		"${aws_security_group.allow_http.id}"
	]
}