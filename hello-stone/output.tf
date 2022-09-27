output "public_dns" {
    description = "print out the machine dns address"
    value = aws_instance.hello-stone.public_dns
}