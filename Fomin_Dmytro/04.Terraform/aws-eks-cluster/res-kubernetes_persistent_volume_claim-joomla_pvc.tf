# Resource: kubernetes_persistent_volume_claim
# This resource allows the user to request for and claim to a persistent volume.
#https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim

resource "kubernetes_persistent_volume_claim" "joomla_pvc" {
  metadata {
    name = "joomla-pvc"
    labels = {
      env     = "DevOps-CC21"
      Country = "Ukraine"
    }
  }

  wait_until_bound = false
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
