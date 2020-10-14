output "instance_id" {
  description = "ocid of created instances. "
  value       = oci_core_instance.wirehole_instance.id
}

output "private_ip" {
  description = "Private IPs of created instances. "
  value       = oci_core_instance.wirehole_instance.private_ip
}

output "public_ip" {
  description = "Public IPs of created instances. "
  value       = oci_core_instance.wirehole_instance.public_ip
}

locals {
  ansible-inventory = templatefile("inventory.tmpl", {
    wirehole_ip = oci_core_instance.wirehole_instance.public_ip,
    private_key = var.ssh_private_key_path
  })
}

resource "local_file" "wirehole_inventory" {
  content  = local.ansible-inventory
  filename = "../../ansible/inventory/oci_inventory"
}
