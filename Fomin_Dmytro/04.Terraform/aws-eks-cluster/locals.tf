# Locals
# A local value assigns a name to an expression, so you can use it multiple times within
# a module without repeating it.
# https://www.terraform.io/language/values/locals

locals {
  cluster-name = "${var.cluster_name}-${random_string.suffix.result}"
}
