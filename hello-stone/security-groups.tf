resource "aws_security_group" "allow_ssh" {
	name        = "allow_ssh"
	description = "Allow SSH traffic"

    // Accept ssh connections only from the machine that created the instance
	ingress {
		description = "SSH"
		from_port 	= 22
		to_port 	= 22
		protocol 	= "tcp"
		cidr_blocks = ["${data.external.myipaddr.result.ip}/32"]
	}

	tags = {
		Name = "ssh"
	}
}

resource "aws_security_group" "allow_http" {
	name        = "allow_http"
	description = "Allow HTTP inbound traffic"

	ingress {
		description      = "Allow HTTP"
		from_port        = 80
		to_port          = 80
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	egress {
		from_port        = 80
		to_port          = 80
		protocol         = "tcp"
		cidr_blocks      = ["0.0.0.0/0"]
		ipv6_cidr_blocks = ["::/0"]
	}

	tags = {
		Name = "allow_http"
	}
}