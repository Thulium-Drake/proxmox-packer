packer {
  required_plugins {
    # Required for builds on Proxmox
    proxmox = {
      version = "<= 1.2.1"  # 1.2.2 is broken, does not pass VM CPU type to the proxmox server
      source  = "github.com/hashicorp/proxmox"
    }
  }
}
