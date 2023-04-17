resource "aws_dynamodb_table" "jsanchez_clusters_dynamodb" {
  hash_key       = "LockID"
  name           = "${var.clusters_name_prefix}-tf-lock"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Owner     = "jsanchez"
    ManagedBy = "terraform"
  }
}

resource "aws_dynamodb_table" "jsanchez_vpc_dynamodb" {
  hash_key       = "LockID"
  name           = "${var.clusters_name_prefix}-vpc-tf-lock"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Owner     = "jsanchez"
    ManagedBy = "terraform"
  }
}