variable "hcloud_token" {}
variable "hcloud_ssh_key" {}
variable "ssh_private_key_path" {}

variable "server_location" {
    default = "hel1"
}

variable "server_name" {
    default = "wirehole"
}

variable "server_image" {
    default = "ubuntu-20.04"
}

variable "server_type" {
    default = "cx11"
}