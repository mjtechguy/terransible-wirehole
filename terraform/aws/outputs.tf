output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.wirehole.id
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.wirehole.public_ip
}

locals {
  ansible-inventory = templatefile("inventory.tmpl", {
    wirehole_ip = aws_instance.wirehole.public_ip
    private_key = var.ssh_private_key_path
  })
}

resource "local_file" "wirehole_inventory" {
  content  = local.ansible-inventory
  filename = "../../ansible/inventory/aws_inventory"
}
