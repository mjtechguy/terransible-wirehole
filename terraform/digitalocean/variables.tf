variable "do_token" {}
variable "do_ssh_key" {}
variable "ssh_private_key_path" {}

variable "region" {
    default = "nyc3"
}

variable "droplet_name" {
    default = "wireHole"
}

variable "droplet_image" {
    default = "ubuntu-20-04-x64"
}

variable "droplet_size" {
    default = "s-1vcpu-1gb"
}