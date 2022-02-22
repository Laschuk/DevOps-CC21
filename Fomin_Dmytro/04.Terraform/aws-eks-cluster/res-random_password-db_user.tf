# Resource: random_password
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password

# Array generator of <count> elements in the form of strings from a random set of letters, 
# numbers, and special characters <length> characters long.
resource "random_password" "db_user" {
  count            = 2
  length           = 16
  min_lower        = 3
  min_numeric      = 3
  min_upper        = 1
  number           = true
  upper            = true
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>:?"
}
