## Roles
Ansible Roles provide a well-defined framework and structure for setting tasks, variables, handlers, metadata, templates, and other files. They enable us to reuse and share our Ansible code efficiently. Organizing the Ansible content into roles provides us with a structure that is more manageable than just using playbooks

#### Examples
- Createt inventory file
  ```
  mkdir -p /root/ansible/roles
  ```
  ```
  vim /root/ansible/roles/roles-inventory
  ```
  ```
  [db]
  192.168.56.27
  [web]
  192.168.56.26
  ```
- Initialize a new role named webserver
  ```
  cd /root/ansible/roles
  ```
  ```
  ansible-galaxy init webserver
  ```
  ```
  ls webserver/
  ```
- Head to the tasks directory and edit the main.yml file to add play & tasks
  ```
  vim webserver/tasks/main.yml
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
  vim webserver/defaults/main.yml
  ```
  ```
  ---
  # defaults file for webserver
  nginx_version: 1.18.0-0ubuntu1.3
  nginx_custom_directory: /var/www/sample
  ```
  - Run `apt-cache policy nginx` to get available nginx candidate if the version mentioned above is not working
- Override the default variable that defines in the defaults/main.yml file
  ```
  vim webserver/vars/main.yml
  ```
  ```
  ---
  # vars file for webserver
  nginx_custom_directory: /var/www/ubuntu/nginx
  ```
- In the handlers directory, if define any handler that is triggered by the tasks
  ```
  vim webserver/handlers/main.yml
  ```
  ```
  ---
  # handlers file for webserver
  - name: Restart the Nginx service
    service:
      name: nginx
      state: restarted
  ```
- In the templates directory, it leverage a Jinja2 template file for the Nginx configuration
  ```
  vim webserver/templates/nginx.conf.j2
  ```
  ```
  server {
          listen 70;
          listen [::]:70;
          root {{ nginx_custom_directory }};
          index index.html;
          location / {
                  try_files $uri $uri/ =404;
          }
  }
  ```
- Define a static file index.html
  ```
  vim webserver/files/index.html
  ```
  ```
  <html>
   <head>
     <title>GloveLine Web Site. Powered By Nginx </title>
   </head>
   <body>
   <h1>This is the default website</h1>
   <p>The website was deployed by Ansible</p>
   </body>
  </html>
  ```
- Add metadata and information about the role
  ```
  vim webserver/meta/main.yml
  ```
  ```
  galaxy_info:
    author: Jerry
    description: Installs Nginx and host a sample website
    company: Gloveline
    license: Apache-2.0
    role_name: webserver
    min_ansible_version: "2.1"

    platforms:
    - name: Ubuntu
      versions:
        - jammy
        - jellyfish
 
    galaxy_tags:
      - nginx
      - webserver
      - development
      - test
 
  dependencies: []
  ```
- Finally, update the README.md file
  ```
  vim webserver/README.md
  ```
  ```
  ## About
  This is a role created for demonstration purposes

  #### Requirements
  - Ansible
  - Jinja2

  #### Example playbook, add below contents to the file myplay.yml
  ---
  hosts: db
  become: true
  roles:
    - webserver
  ```
- Execute play
  ```
  ansible-playbook -i roles-inventory myplay.yml
  ```
