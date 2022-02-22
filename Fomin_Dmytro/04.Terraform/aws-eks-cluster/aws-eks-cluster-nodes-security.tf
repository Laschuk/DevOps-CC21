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
#
# Create IAM role for EKS Node Group
resource "aws_iam_role" "private-nodes" {
  # The name of the role
  name = "eks-private-node-group"

  # The policy that grants an entity permission to assume the role.
  # Here uses Terraform's built-in function of the JSON encoder to 
  # convert this object to json.
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Version = "2012-10-17"
    }]
  })

  # Full JSON equivalent of the above-created object
  #   assume_role_policy = <<POLICY
  # {
  #   "Version": "2012-10-17",
  #   "Statement": [
  #     {
  #       "Effect": "Allow",
  #       "Principal": {
  #         "Service": "ec2.amazonaws.com"
  #       }, 
  #       "Action": "sts:AssumeRole"
  #     }
  #   ]
  # }
  # POLICY
}




# Resource: aws_iam_role_policy_attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

# The Amazon EKS node kubelet daemon makes calls to AWS APIs on your behalf. Nodes receive permissions for these API 
# calls through an IAM instance profile and associated policies. Before you can launch nodes and register them into a 
# cluster, you must create an IAM role for those nodes to use when they are launched. This requirement applies to nodes 
# launched with the Amazon EKS optimized AMI provided by Amazon, or with any other node AMIs that you intend to use. 
# Before you create nodes, you must create an IAM role with the following IAM policies:
#   - AmazonEKSWorkerNodePolicy
#   - AmazonEC2ContainerRegistryReadOnly
#   - AmazonEKS_CNI_Policy
#
# AmazonEKSWorkerNodePolicy
# This policy allows Amazon EKS worker nodes to connect to Amazon EKS Clusters.
# Policy ARN:   arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
#
resource "aws_iam_role_policy_attachment" "amazon_eks_worker_private_node_policy" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEKSWorkerNodePolicy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  # The role the policy should be applied to
  role = aws_iam_role.private-nodes.name
}



# Amazon EKS supports native VPC (Virtual Private Cloud) networking with the Amazon VPC CNI (Container Network
# Interface) plugin for Kubernetes. This plugin assigns a private IPv4 or IPv6 address from your VPC to each pod.
# The plugin is an open-source project that is maintained on GitHub.
#
# AmazonEKS_CNI_Policy
# This policy provides the Amazon VPC CNI Plugin (amazon-vpc-cni-k8s) the permissions it requires to modify the IP 
# address configuration on your EKS worker nodes. This permission set allows the CNI to list, describe, and modify 
# Elastic Network Interfaces on your behalf. More information on the AWS VPC CNI Plugin is available here: 
#       https://github.com/aws/amazon-vpc-cni-k8s
#
resource "aws_iam_role_policy_attachment" "amazon_eks_cni_private_node_policy" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEKS_CNI_Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  # The role the policy should be applied to
  role = aws_iam_role.private-nodes.name
}



# AmazonEC2ContainerRegistryReadOnly
# Provides read-only access to Amazon EC2 Container Registry repositories.
# Policy ARN:   arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEC2ContainerRegistryReadOnly
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  # The role the policy should be applied to
  role = aws_iam_role.private-nodes.name
}
