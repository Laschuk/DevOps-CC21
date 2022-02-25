# Resource: aws_iam_openid_connect_provider
# Provides an IAM OpenID Connect provider.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider

// For autoscaler

resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["${data.tls_certificate.cluster.certificates[0].sha1_fingerprint}"]
  url             = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
