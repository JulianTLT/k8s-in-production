variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_group_name" {
  type = string
}

variable "instance_types" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

variable "desired_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "min_size" {
  type = number
}