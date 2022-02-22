# Resource: aws_key_pair
#
# Provides an EC2 key pair resource. A key pair is used to control login access to EC2 instances.
# Currently this resource requires an existing user-supplied key pair. This key pair's public 
# key will be registered with AWS to allow logging-in to EC2 instances.
# When importing an existing key pair the public key material may be in any format supported 
# by AWS. Supported formats (per the AWS documentation) are:
#   - OpenSSH public key format (the format in ~/.ssh/authorized_keys)
#   - Base64 encoded DER format
#   - SSH public key file format as specified in RFC4716
#
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair

//Generating Key-Value Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "eks-key"
  public_key = tls_private_key.tls_key.public_key_openssh

  depends_on = [
    tls_private_key.tls_key
  ]
}
