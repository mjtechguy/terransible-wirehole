output "instance_id" {
  description = "ocid of created instances. "
  value       = ["${oci_core_instance.wirehole_instance.id}"]
}

output "private_ip" {
  description = "Private IPs of created instances. "
  value       = ["${oci_core_instance.wirehole_instance.private_ip}"]
}

output "public_ip" {
  description = "Public IPs of created instances. "
  value       = ["${oci_core_instance.wirehole_instance.public_ip}"]
}

data  "template_file" "ansible-inventory" {
    template = "${file("inventory.tmpl")}"
    vars = {
        wirehole_ip = oci_core_instance.wirehole_instance.public_ip,
        private_key = var.ssh_private_key_path
    }
}
resource "local_file" "wirehole_inventory" {
  content  = data.template_file.ansible-inventory.rendered
  filename = "./ansible/inventory"
}
