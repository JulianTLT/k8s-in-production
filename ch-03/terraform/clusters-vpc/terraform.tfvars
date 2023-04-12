aws_region           = "us-east-1"
clusters_name_prefix = "jsanchez-clusters"
vpc_block            = "10.40.0.0/21"
public_subnets_prefix_list = [
  "10.40.0.0/24",
  "10.40.1.0/24",
  "10.40.2.0/24",
]
private_subnets_prefix_list = [
  "10.40.3.0/24",
  "10.40.4.0/24",
  "10.40.5.0/24",
]