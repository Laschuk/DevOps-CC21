# Provider: aws
# Providers allow Terraform to interact with cloud providers, SaaS providers, and other APIs.
# Use the Amazon Web Services (AWS) provider to interact with the many resources supported by 
# AWS. You must configure the provider with the proper credentials before you can use it.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
# https://www.terraform.io/language/providers/configuration

provider "aws" {
  # Name of [block] with credentials in file ~/.aws/credentials
  profile = "default"
  # Code of Data Center where cluster deploy
  region = var.aws_region

  default_tags {
    tags = {
      owner        = "Dmytro Fomin"
      cluster_name = "${local.cluster-name}"
      env          = "DevOps-CC21"
    }
  }
}

locals {
  cluster-name = "${var.cluster_name}-${random_string.suffix.result}"
}