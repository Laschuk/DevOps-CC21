# Data Source: aws_iam_policy_document
# Generates an IAM policy document in JSON format for use with resources that expect policy documents 
# such as aws_iam_policy.
# Using this data source to generate policy documents is optional. It is also valid to use literal JSON 
# strings in your configuration or to use the file interpolation function to read a raw JSON policy 
# document from a file.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document

data "aws_iam_policy_document" "eks_cluster_autoscaler_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.cluster.url, "https://", "")}:sub"
      # Kubernetes service account
      # https://kubernetes.io/docs/reference/access-authn-authz/service-accounts-admin/
      # https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
      # Example (look at ./k8s/cluster-autoscaler.yaml):
      #     apiVersion: v1
      #     kind: ServiceAccount
      #     metadata:
      #         name: cluster-autoscaler
      #         namespace: kube-system
      values = ["system:serviceaccount:kube-system:cluster-autoscaler"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.cluster.arn]
      type        = "Federated"
    }
  }
}
