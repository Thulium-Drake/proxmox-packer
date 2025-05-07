source "proxmox-iso" "default" {
  proxmox_url = "${var.proxmox_url}"
  username = "${var.proxmox_user}"
  token = "${var.proxmox_token}"
  boot_command              = [
    "e <down><down><down><end> proxmox-start-auto-installer <F10><wait1m>",
    "proxmox-fetch-answer http http://{{ .HTTPIP }}:{{ .HTTPPort }}/pve-${var.variant}.toml > /run/automatic-installer-answers; exit<enter>",
    "<wait3m>root<enter>Password123!<enter>apt update; apt install -y curl qemu-guest-agent<enter><wait20s>",
    "curl http://{{ .HTTPIP }}:{{ .HTTPPort }}/pve-${var.variant}-network > /etc/network/interfaces<enter>",
    "curl http://{{ .HTTPIP }}:{{ .HTTPPort }}/pve-${var.variant}-hosts.tmpl > /tmp/pve-default-hosts.tmpl<enter>",
    "systemctl enable --now qemu-guest-agent<enter>"
  ]
  boot_iso {
    type                    = "scsi"
    iso_file                = "${var.proxmox_iso_pool}/${var.iso_image}"
    unmount                 = true
  }
  boot_wait                 = "10s"
  cloud_init                = true
  cloud_init_storage_pool   = "${var.proxmox_storage_pool}"
  cores                     = "4"
  memory                    = "4096"
  cpu_type                  = "host"
  os                        = "l26"
  disks {
    disk_size               = "${var.proxmox_storage_disk_size}G"
    format                  = "${var.proxmox_storage_format}"
    storage_pool            = "${var.proxmox_storage_pool}"
    type                    = "scsi"
  }
  http_directory            = "web"
  http_port_min             = 8080
  http_port_max             = 8080
  insecure_skip_tls_verify  = true
  network_adapters {
    model = "virtio"
    bridge = "${var.proxmox_nic_bridge}"
    vlan_tag = "14"
    firewall = "false"
  }
  node                 = "${var.proxmox_node}"
  scsi_controller      = "virtio-scsi-single"
  ssh_username         = "root"
  ssh_private_key_file = "~/.ssh/id_ed25519"
  ssh_port             = 22
  ssh_timeout          = "30m"
  template_description = "${var.template_description}"
  template_name        = "${var.template_name}"
  vm_id                = "${var.vm_id}"
  vm_name              = "${var.template_name}"
}
