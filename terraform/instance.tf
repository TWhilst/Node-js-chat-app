resource "aws_instance" "ansible_instance" {
  ami           = data.aws_ami.ubuntu_data.id
  instance_type = "t2.micro"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnets.Project1_subnet.id
  vpc_security_group_ids = ["aws_security_group.Project1_sg_https", "aws_security_group.Project1_sg-ssh.id", "aws_security_group.Project1_sg-http.id"]
  user_data = file("ansible.sh")

  tags = {
    Name = "project2_ansible"
  }
}

resource "aws_instance" "jenkins_instance" {
  ami           = data.aws_ami.ubuntu_data.id
  instance_type = "t2.micro"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnets.Project1_subnet.id
  vpc_security_group_ids = ["aws_security_group.Project1_sg_https", "aws_security_group.Project1_sg-ssh.id", "aws_security_group.Project1_sg-http.id"]
  user_data = file("jenkins.sh")

  tags = {
    Name = "project2_jenkins"
  }
}