resource "aws_iam_policy" "external_dns_policy" {
  name = "AllowExternalDNSUpdates"
  description = "Policy for external-dns addon EKS"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "route53:ChangeResourceRecordSets"
        ],
        "Resource": [
          "arn:aws:route53:::hostedzone/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ],
        "Resource": [
          "*"
        ]
      }
    ]
  })
}

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
      variable = "${data.aws_iam_openid_connect_provider.cluster_oidc.url}:sub"
      values = ["system:serviceaccount:${var.namespace}:${var.service_account}"]
    }
  }

}

resource "aws_iam_role" "external_dns_irsa" {
  name = "external-dns-irsa-role"
  assume_role_policy = data.aws_iam_policy_document.trust_relationship.json
  tags = {
    ManagedBy = "terraform"
    Owner = "jsanchez"
  }
}

resource "aws_iam_role_policy_attachment" "exterlan-dns-attachment" {
  policy_arn = aws_iam_policy.external_dns_policy.arn
  role = aws_iam_role.external_dns_irsa.name
  depends_on = [
    aws_iam_policy.external_dns_policy
  ]
}

output "external_dns_role" {
  value = aws_iam_role.external_dns_irsa
}

output "external_dns_policy" {
  value = aws_iam_policy.external_dns_policy
}
