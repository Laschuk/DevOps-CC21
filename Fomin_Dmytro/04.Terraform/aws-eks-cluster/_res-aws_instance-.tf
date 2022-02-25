# Resource: aws_instance
# Provides an EC2 instance resource. This allows instances to be created, updated, and 
# deleted. Instances also support provisioning.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

# resource "aws_instance" "web" {
#     ami           = data.aws_ami.ubuntu.id
#     instance_type = "t2.micro"
#     vpc_security_group_ids = [aws_security_group.worker_nodes_ssh_access.id]

#     # network_interface {
#     #     network_interface_id = aws_network_interface.foo.id
#     #     device_index         = 0
#     # }

#     # credit_specification {
#     #     cpu_credits = "unlimited"
#     # }

#     tags = {
#         Name = "Example_of_instance"
#     }
# }
