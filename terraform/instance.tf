resource "aws_instance" "ansible_instance" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.medium"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.Project1_sg_ssh.id, data.aws_security_group.Project1_sg_http.id]
  user_data = file("~/.vscode/Node-js-chat-app/ansible.sh")

  tags = {
    Name = "socket_ansible"
  }
}

resource "aws_instance" "jenkins_instance" {
  ami           = data.aws_ami.linux_ami.id
  instance_type = "t2.micro"
  key_name      = "toche-key1"
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [data.aws_security_group.Project1_sg_ssh.id, data.aws_security_group.Project1_sg_http.id, data.aws_security_group.Project1_sg_jenkins.id]
  user_data = file("~/.vscode/Node-js-chat-app/jenkins.sh")

  tags = {
    Name = "socket_jenkins"
  }
}