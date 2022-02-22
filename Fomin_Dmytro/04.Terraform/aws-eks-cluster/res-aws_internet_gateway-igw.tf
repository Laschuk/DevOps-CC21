# An internet gateway is a horizontally scaled, redundant, and highly available VPC component that 
# enables communication between your VPC and the internet. 
# To use an internet gateway, attach it to your VPC and specify it as a target in your subnet route 
# table for internet-routable IPv4 or IPv6 traffic. An internet gateway performs network address 
# translation (NAT) for instances that have been assigned public IPv4 addresses.

# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "igw" {
  # The VPC ID to create in
  vpc_id = aws_vpc.virt_lan.id

  # A map of tags to assign to the resource.
  tags = {
    "Name" = "igw"
  }

}
