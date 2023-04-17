data "aws_vpc" "clusters_vpc" {
  filter {
    name   = "tag:Name"
    values = ["jsanchez-clusters-vpc"]
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.clusters_vpc.id
  filter {
    name   = "tag:Type"
    values = ["private"]
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.clusters_vpc.id
  filter {
    name   = "tag:Type"
    values = ["public"]
  }
}

module "cluster" {
  source = "../modules/eks-cluster"

  cluster_full_name = var.cluster_full_name
  cluster_version   = var.cluster_version
  common_tags       = local.common_tags
  private_subnets   = data.aws_subnet_ids.private_subnets.ids
  public_subnets    = data.aws_subnet_ids.public_subnets.ids
  vpc_id            = data.aws_vpc.clusters_vpc.id
}

module "nodegroup" {
  source = "../modules/eks-nodegroup"

  cluster_name    = var.cluster_full_name
  common_tags     = local.common_tags
  instance_types  = ["t3.small"]
  node_group_name = "jsanchez-ng-1"
  subnet_ids      = data.aws_subnet_ids.private_subnets.ids
  desired_size    = 1
  max_size        = 2
  min_size        = 1

  depends_on = [
    module.cluster
  ]
}

locals {
  common_tags = {
    ManagedBy = "terraform"
    Owner     = "jsanchez"
  }
}

