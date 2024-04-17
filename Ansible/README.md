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
