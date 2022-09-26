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
  associate_public_ip_address = true
  key_name = "key"

  tags = {
    Name = "hello-stone"
  }

  vpc_security_group_ids = [
		"${aws_security_group.allow_ssh.id}",
		"${aws_security_group.allow_http.id}",
        "${aws_security_group.allow_tls.id}"
	]

    provisioner "remote-exec" {
      inline = [
        "echo Waiting for instance to be available"
      ]

      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/key.pem")
        host = aws_instance.hello-stone.public_ip
      }
    }

    provisioner "local-exec" {
      command = "ansible-playbook -i ${aws_instance.hello-stone.public_ip}, --private-key ${"~/key.pem"} docker.yaml"
    }
}