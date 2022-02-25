# Resource: aws_s3_bucket_public_access_block
# Manages S3 bucket-level Public Access Block configuration.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block

# resource "aws_s3_bucket_public_access_block" "tfstate" {
#   bucket = aws_s3_bucket.tfstate.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }
