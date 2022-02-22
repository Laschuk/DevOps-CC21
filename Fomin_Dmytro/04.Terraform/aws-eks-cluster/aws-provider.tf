provider "aws" {
  # Name of [block] with credentials in file ~/.aws/credentials
  profile = "default"
  # Code of Data Center where cluster deploy
  region = var.aws_region

  default_tags {
    tags = {
      owner        = "Dmytro Fomin"
      cluster_name = "${var.cluster_name}"
      project      = "DevOps-CC21"
    }
  }
}
