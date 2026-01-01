# Kamal Ansible Manager

Based on [Kamal Ansible Manager](https://github.com/guillaumebriday/kamal-ansible-manager) by [Guillaume Briday](https://github.com/guillaumebriday)

## Getting Started

Create an `inventory` file with the servers' IP addresses:
```ini
[webservers]
server.ip.address.1
server.ip.address.2
```

Install the requirements:
```bash
$ ansible-galaxy install -r requirements.yml
```

## Configuring vars

Variables can be configured in the `playbook.yml` file.

For example:
```yaml
  vars:
    security_autoupdate_reboot: "true"
    security_autoupdate_reboot_time: "03:00"
```

## Running the playbook

Run the playbook:
```bash
$ ansible-playbook playbook.yml
```
