resource "aws_security_group" "eks_cluster_sg" {
  name = "${var.cluster_full_name}-cluster-sg"
  description = "EKS ${var.cluster_full_name} cluster security group"
  vpc_id = var.vpc_id
  tags = merge(
          var.common_tags,
          {
            Name = "${var.cluster_full_name}-cluster-sg"
            "kubernetes.io/cluster/${var.cluster_full_name}" = "owned"
          }
  )
}