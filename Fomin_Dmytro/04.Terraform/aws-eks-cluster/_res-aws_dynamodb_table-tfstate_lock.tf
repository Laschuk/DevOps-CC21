# Resource: aws_dynamodb_table
# Provides a DynamoDB table resource
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table

# resource "aws_dynamodb_table" "tfstate_lock" {
#   name           = var.dynamodb-table
#   billing_mode   = "PROVISIONED"
#   read_capacity  = 20
#   write_capacity = 20
#   hash_key       = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     Name = var.dynamodb-table
#     env  = "DevOps-CC21"
#   }

#   depends_on = [aws_s3_bucket.tfstate]
# }
