# Resource: aws_autoscaling_group
# Provides an Auto Scaling Group resource.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

# resource "aws_autoscaling_group" "example" {
#     name                 = "terraform-asg-example"
#     launch_configuration = aws_launch_configuration.example.id
#     availability_zones   = data.aws_availability_zones.all.names
#     min_size             = 1
#     max_size             = 2
#
#     load_balancers = [aws_elb.example.name] 
#     health_check_type = "ELB"
#
#     lifecycle {
#         create_before_destroy = true
#     }

#     tag {
#         key = "Name"
#         value = "terraform-asg-example"
#         propagate_at_launch = true
#     }
# }
