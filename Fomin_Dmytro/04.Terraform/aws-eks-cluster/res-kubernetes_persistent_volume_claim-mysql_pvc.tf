# Resource: kubernetes_persistent_volume_claim
# This resource allows the user to request for and claim to a persistent volume.
#https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim

//Creating PVC for MySQL Pod
resource "kubernetes_persistent_volume_claim" "mysql_pvc" {
  metadata {
    name = "mysql-pvc"
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
        storage = "500Mi"
      }
    }
  }
}
