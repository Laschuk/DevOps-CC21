# Resource: aws_iam_policy
# Provides an IAM policy.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy

resource "aws_iam_policy" "eks_cluster_autoscaler" {
  name = "${local.cluster-name}-autoscaler"

  policy = jsonencode({
    Statement = [{
      Action = [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeTags",
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "ec2:DescribeLaunchTemplateVersions"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
    Version = "2012-10-17"
  })
}
