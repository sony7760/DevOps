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
- Head to the tasks directory and edit the main.yml file to add play & tasks
  ```
  vim tasks/main.yml
  ```
  ```
  ---
  # tasks file for webserver
  - name: Update and upgrade apt
    ansible.builtin.apt:
      update_cache: yes
      cache_valid_time: 3600
      upgrade: yes
 
  - name: "Install Nginx to version {{ nginx_version }}"
    ansible.builtin.apt:
      name: "nginx={{ nginx_version }}"
      state: present
 
  - name: Copy the Nginx configuration file to the webserver host
    template:
      src: templates/nginx.conf.j2
      dest: /etc/nginx/sites-available/default
  - name: Create link to the new config to enable it
    file:
      dest: /etc/nginx/sites-enabled/default
      src: /etc/nginx/sites-available/default
      state: link
 
  - name: Create document root
    ansible.builtin.file:
      path: "{{ nginx_custom_directory }}"
      state: directory
 
  - name: Copy index.html to the document root
    copy:
      src: files/index.html
      dest: "{{ nginx_custom_directory }}/index.html"
    notify: Restart the Nginx service
  ```
- Set default values for the variables used in the tasks
  ```
  vim defaults/main.yml
  ```
  ```
  ---
  # defaults file for webserver
  nginx_version: 1.18.0-0ubuntu1.3
  nginx_custom_directory: /var/www/sample
  ```
