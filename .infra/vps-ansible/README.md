# VPS Ansible

Server provisioning for Crooz. Roles are provided by the [vps-ansible](https://github.com/fcatuhe/vps-ansible) submodule.

## Getting Started

1. Create an `inventory` file with the server IP:
```ini
[webservers]
your.server.ip.address
```

2. Install Ansible Galaxy requirements:
```bash
ansible-galaxy install -r vps-ansible/requirements.yml
```

3. Run the playbook:
```bash
ansible-playbook playbook.yml
```
