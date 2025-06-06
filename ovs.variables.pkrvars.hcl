iso_image            = "proxmox-ve_8.4-1.iso"
template_description = "Proxmox VE Image generated by Packer - Contains cloud-init disk"
template_name        = "pve-template"
vm_id                = "952"
proxmox_node         = "lab"
proxmox_storage_pool = "vmdata"
proxmox_iso_pool     = "data:iso"
proxmox_nic_bridge   = "vmbr0"
proxmox_storage_disk_size = "50"

post_prov_commands = [
    "sed -i 's/https/http/' /etc/apt/sources.list.d/pve-enterprise.list",
    "sed -i 's/enterprise/download/' /etc/apt/sources.list.d/pve-enterprise.list",
    "sed -i 's/enterprise/no-subscription/' /etc/apt/sources.list.d/pve-enterprise.list",
    "sed -i 's/https/http/' /etc/apt/sources.list.d/ceph.list",
    "sed -i 's/enterprise/download/' /etc/apt/sources.list.d/ceph.list",
    "sed -i 's/enterprise/no-subscription/' /etc/apt/sources.list.d/ceph.list",
    "apt update",
    "apt -y dist-upgrade",
    "apt -y install openvswitch-switch cloud-init qemu-guest-agent python3 python3-pip",
    "apt clean all",
    "mv /tmp/pve-default-hosts.tmpl /etc/cloud/templates/hosts.debian.tmpl",
    "shred -u /etc/ssh/*_key /etc/ssh/*_key.pub",
    "rm -f /var/run/utmp",
    ">/var/log/lastlog",
    ">/var/log/wtmp",
    ">/var/log/btmp",
    "rm -rf /tmp/* /var/tmp/*",
    "unset HISTFILE; rm -rf /home/*/.*history /root/.*history",
    "rm -f /root/*ks",
    "rm -rf /root/.ssh/*",
    "passwd -d root",
    "passwd -l root"
]
