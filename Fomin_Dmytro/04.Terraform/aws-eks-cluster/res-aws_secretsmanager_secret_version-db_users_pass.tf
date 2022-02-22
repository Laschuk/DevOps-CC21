# Resource: aws_secretsmanager_secret_version
# Provides a resource to manage AWS Secrets Manager secret version including its secret value.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version

resource "aws_secretsmanager_secret_version" "db_root_pass" {
  secret_id     = aws_secretsmanager_secret.db_root.id
  secret_string = random_password.db_user[0].result
}

resource "aws_secretsmanager_secret_version" "db_user_ver" {
  secret_id     = aws_secretsmanager_secret.db_user.id
  secret_string = random_password.db_user[1].result
}
