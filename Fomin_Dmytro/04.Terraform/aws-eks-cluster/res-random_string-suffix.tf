# Resource: random_string
# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string

# Generates a string from a random sequence of 
# letters and numbers of length 4 characters

resource "random_string" "suffix" {
  length = 4
  number = true
  lower  = true
  upper  = false
  # Special characters excluded
  special = false
}
