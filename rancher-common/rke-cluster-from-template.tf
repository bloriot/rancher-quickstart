# Create RKE cluster from template
resource "rancher2_cluster" "cluster_from_tpl" {
  provider = rancher2.admin

  name         = "clus-tpl-1"
  description  = "RKE cluster created from cluster-template"
  cluster_template_id = rancher2_cluster_template.tpl_test_rke.id
#  cluster_template_revision_id = rancher2_cluster_template.tpl_test_rke.template_revisions.0.id
  cluster_template_revision_id = rancher2_cluster_template.tpl_test_rke.default_revision_id

  depends_on = [rancher2_cluster_template.tpl_test_rke]
}

# Create a new rancher2 Node Pool
resource "rancher2_node_pool" "aws_node_pool" {
  provider = rancher2.admin

  cluster_id =  rancher2_cluster.cluster_from_tpl.id
  name = "pool-aws"
  hostname_prefix =  "aws-cluster-0"
  node_template_id = "cattle-global-nt:nt-bktbj"
  quantity = 1
  control_plane = true
  etcd = true
  worker = true
}
