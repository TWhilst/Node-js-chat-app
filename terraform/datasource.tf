data "aws_vpc" "Project1" {
  id                = var.vpc_id
}

data "aws_ami" "ubuntu_data" {
  most_recent = true
  owners          = ["099720109477"]

  filter {
    name            = "name"
    values          = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

}

data "aws_subnets" "Project1_subnet" {
  filter {
    name   = "tag:Name"
    values = ["main-public"]
  }

}

data "aws_security_group" "Project1_sg-ssh" {
    name   = "main-sg-ssh"
}

data "aws_security_group" "Project1_sg-http" {
    name   = "main-sg-http"
}