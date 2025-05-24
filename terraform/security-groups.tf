variable "vpc_id" {
    type     = string
    default  = "vpc-0b16e539a6d9d52b8"
    description = "main VPC ID"
}

resource "aws_security_group" "Project1_sg" {
  name        = "main-sg-https"
  description = "allow https access"
  vpc_id      = data.aws_vpc.Project1.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}