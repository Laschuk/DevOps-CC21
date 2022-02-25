# Resource: aws_s3_bucket_versioning
# Provides a resource for controlling versioning on an S3 bucket. Deleting this resource 
# will suspend versioning on the associated S3 bucket.
# https://registry.terraform.io/providers/hashicorp%20%20/aws/latest/docs/resources/s3_bucket_versioning

# resource "aws_s3_bucket_versioning" "tfstate" {
#   bucket = aws_s3_bucket.tfstate.id

#   versioning_configuration {
#     status = "Enabled"
#   }
# }
