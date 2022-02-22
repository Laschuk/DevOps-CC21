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
resource "aws_iam_role_policy_attachment" "nodes_AmazonEKSWorkerNodePolicy" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEKSWorkerNodePolicy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

  # The role the policy should be applied to
  role = aws_iam_role.nodes.name
}
