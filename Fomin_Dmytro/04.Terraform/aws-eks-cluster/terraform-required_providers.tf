# Terraform relies on plugins called "providers" to interact with cloud providers, SaaS providers, 
# and other APIs. Terraform configurations must declare which providers they require so that 
# Terraform can install and use them.

# Resource: Providers
# https://registry.terraform.io/browse/providers
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.20.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0"
    }
  }

  required_version = ">= 0.14.9"
}