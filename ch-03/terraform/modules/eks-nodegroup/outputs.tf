output "nodegroup_arn" {
  value = aws_eks_node_group.node-group.arn
}

output "eks-node-role" {
  value = aws_iam_role.eks_node_role.arn
}

output "nodegroup_name" {
  value = aws_eks_node_group.node-group.node_group_name
}

output "nodegroup_subnets" {
  value = aws_eks_node_group.node-group.subnet_ids
}

output "nodegroup_status" {
  value = aws_eks_node_group.node-group.status
}
