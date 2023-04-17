output "security_group" {
  value = aws_security_group.eks_cluster_sg.id
}

output "certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_vpc" {
  value = aws_eks_cluster.eks_cluster.vpc_config[0].vpc_id
}

output "cluster_status" {
  value = aws_eks_cluster.eks_cluster.status
}