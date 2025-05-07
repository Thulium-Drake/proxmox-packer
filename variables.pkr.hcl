# Proxmox credentials
variable "proxmox_url" {
  type    = string
  default = "${env("PROXMOX_URL")}"
}
variable "proxmox_user" {
  type    = string
  default = "${env("PROXMOX_USER")}"
}
variable "proxmox_token" {
  type    = string
  default = "${env("PROXMOX_TOKEN")}"
}

variable "proxmox_node" {
  type    = string
  description = "Which node in the Proxmox cluster to start the virtual machine on during creation"
}

variable "proxmox_iso_pool" {
  type    = string
}

variable "proxmox_storage_format" {
  type    = string
  default = "raw"
}

variable "proxmox_storage_disk_size" {
  type    = string
  default = "16"
  description = "Disk size in GB"
}

variable "proxmox_nic_bridge" {
  type    = string
  description = "Bridge name"
}

variable "proxmox_storage_pool" {
  type    = string
}

variable "variant" {
  type    = string
  default = "${env("VARIANT")}"
  description = "Image flavor variable used in building"
}

variable "iso_image" {
  type    = string
}

variable "template_description" {
  type    = string
}

variable "template_name" {
  type    = string
}

variable "vm_id" {
  type    = string
}

variable "post_prov_commands" {
  type    = list(string)
  default = ["uname -a","date"]
}
