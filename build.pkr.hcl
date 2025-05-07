build {
  sources = ["source.proxmox-iso.${var.variant}"]

  provisioner "shell" {
    inline = var.post_prov_commands
  }
}
