# Data: aws_ami
# Use this data source to get the ID of a registered AMI (Amazon Machine Image) for 
# use in other resources, for example, to run on the EC2 Instance.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}
