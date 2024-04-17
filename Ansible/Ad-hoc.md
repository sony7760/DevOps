## About
An ad-hoc command in Ansible is a one-time command executed from the command line without the need to write a playbook. It allows you to perform quick tasks on remote hosts without creating separate playbook files. Ad-hoc commands are especially useful for tasks such as running a single command on multiple hosts, gathering information about hosts, or performing simple configuration tasks. Ad-hoc commands are executed using the ansible command with specified options and arguments

#### Example
- Install apache2 webserver package on localhost
  ```
  ansible localhost -m ansible.builtin.apt -a "name=apache2 state=present" -b -K
  ```
  - `ansible` is the  command utility
  - `localhost` is the managed node
  - `-m` is the ansible module(ansible.builtin.apt) name
  - `-a` is the task to be executed on manged nodes
  - `-b` uses become to execute with elevated privileges
  - `-K` prompts for the privilege escalation password
- To uninstall apche2, change the state  present => absent
