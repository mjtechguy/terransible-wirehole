output "droplet_id" {
    description = "ID of the Droplet created"
    value       = digitalocean_droplet.wirehole.id
}

output "private_ip" {
    description = "Private IP of the droplet"
    value       = digitalocean_droplet.wirehole.ipv4_address_private
}

output "public_ip" {
    description = "Public IP of the droplet"
    value       = digitalocean_droplet.wirehole.ipv4_address
}

locals {
  ansible-inventory = templatefile("inventory.tmpl", {
    wirehole_ip = digitalocean_droplet.wirehole.ipv4_address
    private_key = var.ssh_private_key_path
  })
}

resource "local_file" "wirehole_inventory" {
  content  = local.ansible-inventory
  filename = "../../ansible/inventory/do_inventory"
}