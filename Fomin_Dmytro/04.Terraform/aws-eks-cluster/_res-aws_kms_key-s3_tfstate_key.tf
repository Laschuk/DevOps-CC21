# Resource: aws_kms_key
# Manages a single-Region or multi-Region primary AWS KMS (Key Management Service) key.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key

# resource "aws_kms_key" "s3_tfstate_key" {
#   description             = "This key is used to encrypt AWS S3 Bucket objects"
#   deletion_window_in_days = 14
#   enable_key_rotation     = true
# }
