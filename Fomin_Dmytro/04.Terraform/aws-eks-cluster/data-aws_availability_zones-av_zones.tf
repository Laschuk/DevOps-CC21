# Data: aws_availability_zones
# The Availability Zones data source allows access to the list of AWS Availability Zones which can 
# be accessed by an AWS account within the region configured in the provider.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones

data "aws_availability_zones" "av_zones" {}