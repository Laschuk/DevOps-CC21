# Generates a string from a random sequence of 
# letters and numbers of length 4 characters
resource "random_string" "sufix" {
  length = 4
  number = true
  lower  = true
  upper  = false
  # Special characters excluded
  special = false
}

# Generator of a random set of letters, numbers, 
# and special characters as a string of 16 characters
resource "random_password" "passwd" {
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