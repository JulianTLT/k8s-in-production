output "clusters_state_bucket" {
  value = aws_s3_bucket.jsanchez_clusters_state.bucket
}
output "vpc_state_bucket" {
  value = aws_s3_bucket.jsanchez_vpc_state.bucket
}

output "vpc_dynamo" {
  value = aws_dynamodb_table.jsanchez_vpc_dynamodb.name
}

output "clusters_dynamo" {
  value = aws_dynamodb_table.jsanchez_clusters_dynamodb.name
}