# Amazon VPC (Virtual Private Cloud) enables you to launch AWS resources into a virtual network 
# that you've defined. This virtual network closely resembles a traditional network that you'd 
# operate in your own data center, with the benefits of using the scalable infrastructure of AWS.

# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "virt_lan" {
  # The CIDR (Classless Inter-Domain Routing) block for the VPC.
  cidr_block = var.vpc-subnet-cidr
  # Make your instances shared on the host
  instance_tenancy = "default"

  # Require for EKS. Enable/disable DNS support in the VPC.
  enable_dns_support = true

  # Required for EKS. Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = true

  # Enable/disable ClassicLink DNS Support for the VPC.
  enable_classiclink_dns_support = false

  # Request an Amazon-provided IPv6 CIDR block with a /56 prefix length
  assign_generated_ipv6_cidr_block = false

  # A map of tags to assign to the resource.
  tags = {
    "Name" = "virt_lan"
  }
}
