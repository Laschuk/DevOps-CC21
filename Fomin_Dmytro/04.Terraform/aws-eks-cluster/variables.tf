# Resource: variables
# https://www.terraform.io/language/values/variables

variable "cluster_name" {
  description = "The name of AWS EKS Cluster"
  type        = string
  default     = "eks"
}

variable "aws_region" {
  description = "The AWS Region to deploy EKS"
  type        = string
  default     = "eu-central-1"
}

variable "availability-zones" {
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  type        = list(any)
  description = "The AWS AZ to deploy EKS"
}

variable "vpc-subnet-cidr" {
  default     = "192.168.0.0/16"
  type        = string
  description = "The AWS VPC Subnet CIDR"
}

variable "all-subnents-cidr" {
  default     = ["192.168.0.0/18", "192.168.64.0/18", "192.168.128.0/18", "192.168.192.0/18"]
  type        = list(any)
  description = "List of all AWS VPC Subnets CIDR"
}

variable "private-subnet-cidr" {
  default     = ["192.168.128.0/18", "192.168.192.0/18"]
  type        = list(any)
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["192.168.0.0/18", "192.168.64.0/18"]
  type        = list(any)
  description = "Public Subnet CIDR"
}

variable "private-nodes-desired-capacity" {
  default     = 1
  type        = number
  description = "Autoscaling Desired node capacity"
}

variable "private-nodes-max-size" {
  default     = 1
  type        = number
  description = "Autoscaling maximum node capacity"
}

variable "private-nodes-min-size" {
  default     = 1
  type        = number
  description = "Autoscaling Minimum node capacity"
}

variable "private-nodes-instance-type" {
  default     = "t2.micro"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "public-nodes-desired-capacity" {
  default     = 1
  type        = number
  description = "Autoscaling Desired node capacity"
}

variable "public-nodes-max-size" {
  default     = 1
  type        = number
  description = "Autoscaling maximum node capacity"
}

variable "public-nodes-min-size" {
  default     = 1
  type        = number
  description = "Autoscaling Minimum node capacity"
}

variable "public-nodes-instance-type" {
  default     = "t2.micro"
  type        = string
  description = "Worker Node EC2 instance type"
}
