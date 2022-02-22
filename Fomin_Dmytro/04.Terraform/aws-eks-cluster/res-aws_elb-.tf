# Resource: aws_elb
# Provides an ELB (Elastic Load Balancer) resource, also known as a "Classic Load 
# Balancer" after the release of ALB/NLB (Application/Network Load Balancers).
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb

# # Create a new load balancer
# resource "aws_elb" "bar" {
#   name               = "terraform-asg-example"
#   security_groups    = [aws_security_group.elb.id]
#   availability_zones = data.aws_availability_zones.all.names

#   health_check {
#     target              = "HTTP:${var.server_port}/"
#     interval            = 30
#     timeout             = 3
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }

# # This adds a listener for incoming HTTP requests.
#   listener {
#     lb_port           = var.elb_port
#     lb_protocol       = "http"
#     instance_port     = var.server_port
#     instance_protocol = "http"
#   }

#   tags = {
#     Name = "foobar-terraform-elb"
#   }
# }
