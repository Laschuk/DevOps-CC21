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
resource "aws_iam_role_policy_attachment" "nodes_AmazonEKS_CNI_Policy" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEKS_CNI_Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

  # The role the policy should be applied to
  role = aws_iam_role.nodes.name
}
