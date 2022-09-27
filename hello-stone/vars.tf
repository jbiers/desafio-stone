variable "access_key" {
    type = string
    description = "your aws access key"
}

variable "secret_key" {
    type = string
    description = "your aws secret key"
}

variable "aws_key_path" {
    type = string
    description = "the ABSOLUTE path to your AWS key (a .pem file)"
}

variable "aws_key_name" {
    type = string
    description = "the actual name of your AWS key. should not include the .pem extension"
}