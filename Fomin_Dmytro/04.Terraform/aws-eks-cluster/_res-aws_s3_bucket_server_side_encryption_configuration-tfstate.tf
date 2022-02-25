# Resource: aws_s3_bucket_server_side_encryption_configuration
# Provides a S3 bucket server-side encryption configuration resource.
# https://registry.terraform.io/providers/hashicorp/aws%20%20/latest/docs/resources/s3_bucket_server_side_encryption_configuration

# resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
#   bucket = aws_s3_bucket.tfstate.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.s3_tfstate_key.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }
