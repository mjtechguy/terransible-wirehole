output "server_id" {
    description = "ID of the server created"
    value       = hcloud_server.wirehole.id
}

output "public_ip" {
    description = "Public IP of the server"
    value       = hcloud_server.wirehole.ipv4_address
}

locals {
  ansible-inventory = templatefile("inventory.tmpl", {
    wirehole_ip = hcloud_server.wirehole.ipv4_address
    private_key = var.ssh_private_key_path
  })
}

resource "local_file" "wirehole_inventory" {
  content  = local.ansible-inventory
  filename = "../../ansible/inventory/hcloud_inventory"
}