# Resource: aws_security_group
# Provides a security group resource. 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

resource "aws_security_group" "worker_nodes_ssh_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic to the worker nodes of cluster"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.all-subnents-cidr
  }

  tags = {
    Name = "allow_ssh"
  }
}
