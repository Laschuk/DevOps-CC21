# An Identity and Access Management (IAM) role is an IAM identity that you can create in your account 
# that has specific permissions. An IAM role is similar to an IAM user, in that it is an AWS identity 
# with permission policies that determine what the identity can and cannot do in AWS. However, instead 
# of being uniquely associated with one person, a role is intended to be assumable by anyone who needs 
# it. Also, a role does not have standard long-term credentials such as a password or access keys 
# associated with it. Instead, when you assume a role, it provides you with temporary security 
# credentials for your role session.
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html
# 
# Resource: aws_iam_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role


# Amazon EKS managed node groups automate the provisioning and lifecycle management of nodes 
# (Amazon EC2 instances) for Amazon EKS Kubernetes clusters.
# With Amazon EKS managed node groups, you don’t need to separately provision or register the Amazon EC2
# instances that provide compute capacity to run your Kubernetes applications. You can create, 
# automatically update, or terminate nodes for your cluster with a single operation.

# Create IAM role for 
resource "aws_iam_role" "eks_cluster_autoscaler" {
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_autoscaler_assume_role_policy.json
  name               = "eks-cluster-autoscaler"
}
