# Resource: aws_kms_alias
# Provides an alias for a KMS customer master key. AWS Console enforces 1-to-1 mapping 
# between aliases & keys, but API (hence Terraform too) allows you to create as many 
# aliases as the account limits allow you.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias

# resource "aws_kms_alias" "s3_tfstate_key_alias" {
#   name          = "alias/s3-tfstate-key"
#   target_key_id = aws_kms_key.s3_tfstate_key.key_id
# }
