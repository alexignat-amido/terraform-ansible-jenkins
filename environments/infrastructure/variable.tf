variable "region" {
    description = "Define the region"
    default = "eu-west-1"
}

variable "aws_access_key" {
    description = "Provide aws access key"
}

variable "aws_secret_key" {
    description = "Provide aws secret key"
}
variable "vpc_cidr_block" {
    description = "VPC cidr_block"
    default = "10.0.0.0/16"
}
variable "aws_linux_ami" {
    description = "AWS linux AMI for eu-west-1 region"
    default = "ami-047bb4163c506cd98"
}

variable "public_subnet_CIDR_block" {
    default = "10.0.1.0/24"
}
variable "availability_zone" {
    default = "eu-west-1a"
}

