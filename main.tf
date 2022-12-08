provider "aws" {
    region = "us-east-1"
}

variable "subnet_cidr_block" {
  description =  "subnet cidr block"

}

variable "vpc_cidr_block" {
  description = "cidr block for vpc"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "development"
  }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-1b"
    tags = {
        Name: "development-sub-1b"
    }
}

