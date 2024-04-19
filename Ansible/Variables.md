## Variables
Ansible variables are dynamic values used within Ansible playbooks and roles to enable customization, flexibility, and reusability of configurations. They are very similar to variables in programming languages, helping you manage complex tasks more efficiently by allowing the same playbook or role to be applied across different environments, systems, or contexts without the need for hardcoding specific information

- Variables in Ansible can come from different sources and can be used in playbooks, roles, inventory files, and even within modules. Here are the variable types you may encounter while using Ansible,
  - **Playbook variables:** These variables are used to pass values into playbooks and roles and can be defined inline in playbooks or included in external files
  - **Task variables:** These variables are specific to individual tasks within a playbook. These can override other variable types for the scope of the task in which they are defined
  - **Host variables:** Specific to hosts, these variables are defined in the inventory or loaded from external files or scripts and can be used to set attributes that differ between hosts
  - **Group variables:** Similar to host variables but used for a group of hosts and are defined in the inventory or separate files in the group_vars directory
  - **Inventory variables:** These variables are defined in the inventory file itself and can be applied at different levels (host, group, all groups)
  - **Fact variables:** Gathered by Ansible from the target machines, facts are a rich set of variables (including IP addresses, operating system, disk space, etc.) that represent the current state of the system and are automatically discovered by Ansible
  - **Role variables:** Defined within a role, these variables are usually part of the role’s default variables (defaults/main.yaml file) or variables intended to be set by the role user (vars/main.yaml file) and are used to enable reusable and configurable roles
  - **Magic variables:** Special variables such as hostvars, group_names, groups, inventory_hostname, and ansible_playbook_python, provide information about the execution context and allow access to inventory data programmatically
  - **Environment variables:** Used within Ansible playbooks to access environment variables from the system running the playbook or from remote systems

#### Examples
- Create a simple playbook yaml variable
  ```
  vim variables-inventory
  ```
  ```
  [db]
  192.168.56.27
  [web]
  192.168.56.26
  ```
  ```
  vim simple-var.yml
  ```
  ```
  - name: Example Simple Variable
    hosts: all
    become: yes
    vars:
      username: bob

    tasks:
    - name: Add the user {{ username }}
      ansible.builtin.user:
        name: "{{ username }}"
        state: present
  ```
  ```
  ansible-playbook -i variables-inventory simple-var.yml
  ```
- Create a file variable
  ```
  vim user_vars.yml
  ```
  ```
  user_details:
    - { name: testuser1, uid: 1002, groups: "admin, logs" }
    - { name: testuser2, uid: 1003, groups: logs: }
  ```
  ```
  vim users.yml
  ```
  ```
  
  ```
