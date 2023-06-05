output "ebs_csi_role" {
  value = aws_iam_role.ebs_csi_role
}

output "ebs_csi_policy" {
  value = data.aws_iam_policy.ebs_csi_policy
}