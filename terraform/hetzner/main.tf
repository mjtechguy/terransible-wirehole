resource "hcloud_server" "wirehole" {
    image = var.server_image
    name = var.server_name
    location = var.server_location
    server_type = var.server_type
    ssh_keys = [
      var.hcloud_ssh_key
    ]
}