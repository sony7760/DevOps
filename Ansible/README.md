## Ansible
Ansible is an open-source automation tool that simplifies configuration management, application deployment, and task automation. It uses a declarative language(YAML) to define desired states and executes tasks on remote systems over SSH(Linux) or WinRM(Windows), without requiring agents on the managed nodes.

#### Inventory file
The Ansible inventory file is a configuration file that contains a list of hosts and groups of hosts. It helps Ansible determine the remote systems it should connect to. It can be in INI format or YAML format

#### Ad-hoc
An ad-hoc command in Ansible is a one-time command executed from the command line without the need to write a playbook. Ad-hoc commands are executed using the ansible command with specified options and arguments. Ad-hoc commands are quick and easy, but they are not reusable

#### Playbook
Ansible Playbooks are YAML files that define a series of tasks to be executed on remote hosts and and can be used for configuration management and application deployment

#### Facts
In the context of Ansible, "facts gathering" refers to the process of collecting information about remote hosts or managed nodes. Ansible gathers these facts automatically when it connects to the remote hosts during playbook execution. These facts include details such as the operating system, hardware specifications, network configuration, installed packages, and more. Facts gathering is essential for understanding the state of the systems being managed and for making informed decisions during playbook execution

#### Module Library
The Ansible module library includes hundreds of built-in modules covering a wide range of use cases and technologies. These modules are organized into categories based on their functionality, making it easy to find and use the appropriate module for a given task. Some common categories of modules in the Ansible module library include,
- **System:** Modules for managing system-related tasks such as managing files, users, groups, permissions, and system services
- **Packaging:** Modules for installing, updating, and removing software packages on managed nodes
- **Networking:** Modules for configuring network-related tasks such as managing network interfaces, routing, firewall rules, and DNS settings
- **Cloud:** Modules for interacting with various cloud providers, including provisioning and managing cloud resources such as virtual machines, storage, and networks
- **Database:** Modules for managing databases, including tasks such as creating, deleting, and managing database users and permissions
- **Monitoring:** Modules for interacting with monitoring systems and collecting metrics and monitoring data from managed nodes
- **Containers:** Modules for managing container-based environments and container orchestration platforms such as Docker and Kubernetes

#### Files
- Default inventory file
  ```
  /etc/ansible/hosts
  ```
- Config file, used if present
  ```
  /etc/ansible/ansible.cfg
  ```
- User config file, overrides the default config if present
  ```
  ~/.ansible.cfg
  ```
#### Variables
- Override the default ansible inventory file
  ```
  ANSIBLE_INVENTORY
  ```
- Override the default ansible module library path
  ```
  ANSIBLE_LIBRARY
  ```
- Override the default ansible config file
  ```
  ANSIBLE_CONFIG
  ```
