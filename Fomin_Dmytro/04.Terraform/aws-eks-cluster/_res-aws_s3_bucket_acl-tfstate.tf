# Resource: aws_s3_bucket_acl
# Provides an S3 bucket ACL resource.
# IMPORTANT!!! The command 'terraform destroy' does not delete the S3 Bucket ACL, but does remove 
# the resource from Terraform state.
# https://registry.terraform.io/providers/hashicorp/aws%20%20/latest/docs/resources/s3_bucket_acl

# resource "aws_s3_bucket_acl" "tfstate" {
#   bucket = aws_s3_bucket.tfstate.id
#   acl    = "private"
# }
