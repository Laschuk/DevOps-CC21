# Output values make information about your infrastructure available on the command line, and can expose 
# information for other Terraform configurations to use. Output values are similar to return values in 
# programming languages.
# Output values have several uses:
#   - A child module can use outputs to expose a subset of its resource attributes to a parent module.
#   - A root module can use outputs to print certain values in the CLI output after running terraform apply.
#   - When using 'remote state', root module outputs can be accessed by other configurations via a 
#     'terraform_remote_state' data source.
#
# https://www.terraform.io/language/values/outputs

output "cluster_id" {
  description = "The AWS EKS cluster ID"
  value       = aws_eks_cluster.cluster.id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster-name
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "vpc_id" {
  description = "AWS VPC ID"
  value       = aws_vpc.virt_lan.id

  # Setting an output value as sensative prevents 
  # Terraform from showing its value in plan and apply.
  sensitive = false
}

output "eks_cluster_autoscaler_arn" {
  description = "Created role for the Kubernetes service account"
  value       = aws_iam_role.eks_cluster_autoscaler.arn
}

# output "clb_dns_name" {
#   description = "The domain name of the load balancer"
#   value       = aws_elb.example.dns_name
# }
