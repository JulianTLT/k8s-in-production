resource "aws_s3_bucket" "jsanchez_clusters_state" {
  bucket = "${var.clusters_name_prefix}-terraform-state"
  versioning {
    enabled = false
  }
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name      = "${var.clusters_name_prefix} s3 remote tf state store"
    ManagedBy = "terraform"
    Owner     = "jsanchez"
  }
}

resource "aws_s3_bucket" "jsanchez_vpc_state" {
  bucket = "${var.clusters_name_prefix}-vpc-terraform-state"
  versioning {
    enabled = false
  }
  lifecycle {
    prevent_destroy = false
  }
  tags = {
    Name      = "${var.clusters_name_prefix} VPC s3 remote tf state store"
    ManagedBy = "terraform"
    Owner     = "jsanchez"
  }
}