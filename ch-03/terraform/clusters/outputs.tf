output "cluster" {
  value = {
    cluster_name   = module.cluster.cluster_name
    cluster_vpc    = module.cluster.cluster_vpc
    cluster_status = module.cluster.cluster_status
  }
}

output "nodegroup" {
  value = {
    ng_name    = module.nodegroup.nodegroup_name
    ng_subnets = module.nodegroup.nodegroup_subnets
    ng_arn     = module.nodegroup.nodegroup_arn
    ng_status  = module.nodegroup.nodegroup_status
  }
}