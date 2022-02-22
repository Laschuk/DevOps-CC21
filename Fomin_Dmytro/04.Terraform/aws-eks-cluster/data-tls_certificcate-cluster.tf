# Data: tls_certificcate
# Use this data source to get information, such as SHA1 fingerprint or serial number, about the TLS 
# certificates that protect an HTTPS website. Note that the certificate chain isn't verified.
# https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/tls_certificate

data "tls_certificate" "cluster" {
  url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}
