# Proxmox template in Packer
This repo contains a packer config that will create a Proxmox VM template that is mainly developed for integration testing the Ansible modules over at https://github.com/ansible-collections/community.proxmox

## Variants
The config contains multiple variants to test with:

  * default: uses a Linux bridge for networking
  * ovs: uses OpenvSwitch instead for networking

All images use ZFS as their filesystem and have the following network config:

  * VM bridge interface: 10.99.99.1
  * Physical connection: DHCP or whatever is provided by cloud-init
