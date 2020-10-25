variable "aws_access_key" {
  type = string
  description = "AWS access key"
}
variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
}
variable "aws_region" {
  type = string
  description = "AWS region"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}

variable "key_name" {}

variable "ssh_private_key_path" {}