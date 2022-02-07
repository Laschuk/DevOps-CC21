variable "aws_region" {
  default = "eu-central-1"
}

variable "cluster-name" {
  description = "Enter your claster name"
  default     = "terraform-eks"
  type        = string
}

variable "desired_size" {
  description = "How many nodes do you need"
  default     = 1
  type        = number
}

variable "max_size" {
  description = "Max number of nodes"
  default     = 1
  type        = number
}

variable "min_size" {
  description = "Min number of nodes"
  default     = 1
  type        = number
}

variable "instance_type" {
  description = "Enter instance type, default t3.medium"
  default     = "t3.medium"
  type        = string
}
