# Amazon EKS (Elastic Kubernetes Service) is a managed service that you can use to run Kubernetes 
# on AWS (Amazon Web Services) without needing to install, operate, and maintain your own 
# Kubernetes control plane or nodes. Kubernetes is an open-source system for automating the 
# deployment, scaling, and management of containerized applications.
# https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html
#
# Resource: aws_eks_cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

resource "aws_eks_cluster" "cluster" {
  # Name of the cluster.
  name = local.cluster-name

  # The ARN (Amazon Resource Name) of the IAM (Identity and Access Management) role that 
  # provides permissions for the Kubernetes control plane to make calls to AWS API operations 
  # on your behalf
  role_arn = aws_iam_role.eks_cluster.arn

  # Desired Kubernetes master version
  version = "1.18"

  vpc_config {
    # Indicates whether or not the Amazon EKS private API server endpoint is enabled
    # Default is false
    endpoint_private_access = false

    # Indicates whether or not the Amazon EKS public API server endpoint is enabled
    # Default is true
    endpoint_public_access = true

    # Must be in at least two different availability zones
    subnet_ids = [
      aws_subnet.public_1.id,
      aws_subnet.public_2.id,
      aws_subnet.private_1.id,
      aws_subnet.private_2.id
    ]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}
