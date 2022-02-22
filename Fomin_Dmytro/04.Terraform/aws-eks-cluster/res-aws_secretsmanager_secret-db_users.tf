# Resource: aws_secretsmanager_secret
# Provides a resource to manage AWS Secrets Manager secret metadata.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret

resource "aws_secretsmanager_secret" "db_root" {
  name_prefix = "db_root-"
  description = "Root password for MySQL DB server"
}

resource "aws_secretsmanager_secret" "db_user" {
  name_prefix = "db_user-"
  description = "User password for MySQL DB server"
}
