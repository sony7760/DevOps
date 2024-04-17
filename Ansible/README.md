## Ansible
Ansible is an open-source automation tool that simplifies configuration management, application deployment, and task automation. It uses a declarative language(YAML) to define desired states and executes tasks on remote systems over SSH(Linux) or WinRM(Windows), without requiring agents on the managed nodes.

#### Inventory file
The Ansible inventory file is a configuration file that contains a list of hosts and groups of hosts. It helps Ansible determine the remote systems it should connect to. It can be in INI format or YAML format

#### Playbook
Ansible Playbooks are YAML files that define a series of tasks to be executed on remote hosts and and can be used for configuration management and application deployment
