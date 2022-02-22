# Provider: kubernetes
# The Kubernetes (K8S) provider is used to interact with the resources supported 
# by Kubernetes. The provider needs to be configured with the proper credentials 
# before it can be used.
# https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
# https://www.terraform.io/language/providers/configuration

provider "kubernetes" {
  # host                   = data.aws_eks_cluster.cluster.endpoint
  # token                  = data.aws_eks_cluster_auth.cluster.token
  # cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}
