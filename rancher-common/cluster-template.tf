# Create a new rancher2 Cluster Template
resource "rancher2_cluster_template" "tpl_test_rke" {
  provider = rancher2.admin

  name = "template-cluster-test"
  members {
    access_type = "owner"
    user_principal_id = "local://user-7ss47"
  }
  template_revisions {
    name = "V1"
    cluster_config {
      rke_config {
        kubernetes_version = "v1.19.13-rancher1-1"
        network {
          plugin = "canal"
        }
      }
    }
    default = false
  }

  template_revisions {
    name = "V2"
    cluster_config {
      rke_config {
        kubernetes_version = "v1.20.9-rancher1-1"
        network {
          plugin = "canal"
        }
      }
    }
    default = true
  }

  description = "Terraform cluster template test"
}
