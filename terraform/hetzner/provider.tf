terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.22.0"
    }
  }
  required_version = ">= 0.13"
}

provider "hcloud" {
    token = var.hcloud_token
}