# AmazonEC2ContainerRegistryReadOnly
# Provides read-only access to Amazon EC2 Container Registry repositories.
# Policy ARN:   arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
resource "aws_iam_role_policy_attachment" "nodes_AmazonEC2ContainerRegistryReadOnly" {
  # The ARN of the policy you want to apply.
  # https://github.com/z0ph/MAMIP/blob/master/policies/AmazonEC2ContainerRegistryReadOnly
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

  # The role the policy should be applied to
  role = aws_iam_role.nodes.name
}
