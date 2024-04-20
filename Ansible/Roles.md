## Roles
Ansible Roles provide a well-defined framework and structure for setting tasks, variables, handlers, metadata, templates, and other files. They enable us to reuse and share our Ansible code efficiently. Organizing the Ansible content into roles provides us with a structure that is more manageable than just using playbooks

#### Examples
- Initialize a new role named webserver
  ```
  mkdir -p /root/ansible/roles
  ```
  ```
  cd /root/ansible/roles
  ```
  ```
  ansible-galaxy init webserver
  ```
  ```
  cd webserver
  ```
  ```
  ls
  ```
