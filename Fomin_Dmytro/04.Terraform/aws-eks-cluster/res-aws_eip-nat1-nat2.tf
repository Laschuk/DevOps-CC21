# Elastic IP (EIP) address - is a public IPv4 address, which is reachable from 
# the internet. If your instance does not have a public IPv4 address, you can 
# associate an Elastic IP address with your instance to enable communication 
# with the internet.
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html

# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  # EIP may require IGW to exist prior to association.
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "nat2" {
  # EIP may require IGW to exist prior to association.
  # Use depends_on to set an explicit dependency on the IGW.
  depends_on = [aws_internet_gateway.igw]
}
