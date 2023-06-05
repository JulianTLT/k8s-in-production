data "aws_eks_cluster" "jsanchez_cluster" {
  name = "jsanchez-test1"
}

data "aws_iam_openid_connect_provider" "cluster_oidc" {
  url = data.aws_eks_cluster.jsanchez_cluster.identity[0].oidc[0].issuer
}

data "aws_iam_policy_document" "trust_relationship" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [data.aws_iam_openid_connect_provider.cluster_oidc.arn]
      type = "Federated"
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test = "StringEquals"
      variable = "${data.aws_iam_openid_connect_provider.cluster_oidc.url}:aud"
      values = ["sts.amazonaws.com"]
    }
    condition {
      test = "StringEquals"
      variable = "${data.aws_iam_openid_connect_provider.cluster_oidc.url}:sub"
      values = ["system:serviceaccount:${var.namespace}:${var.service_account}"]
    }
  }
}

resource "aws_iam_role" "ebs_csi_role" {
  name = "ebs_csi_role"
  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
  tags = {
    ManagedBy = "terraform"
    Owner = "jsanchez"
  }
}

data "aws_iam_policy" "ebs_csi_policy" {
  name = "AmazonEBSCSIDriverPolicy"
}

resource "aws_iam_role_policy_attachment" "ebs-csi-attachment" {
  policy_arn = data.aws_iam_policy.ebs_csi_policy.arn
  role = aws_iam_role.ebs_csi_role.name
  depends_on = [
    data.aws_iam_policy.ebs_csi_policy
  ]
}
