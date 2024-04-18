## About
Copy a file from localhost to remote
#### Installation step
- Add host to the /etc/hosts file
  ```
  192.168.56.251  web
  ```
- Create inventory file
  ```
  vim web-inventory
  ```
  ```
  [web]
  web	ansibile_host=192.168.56.251   ansible_connection=ssh  ansible_user=root
  ```
- Create playbook yml file for installing curl
  ```
  vim copy.yml
  ```
  ```
  # Copy index.html file to web host
  ---
  - gather_facts: true
    hosts: web

    tasks:
      - name: "Copy index.html"
        ansible.builtin.copy:
          src: /root/ansible/index.html
          dest: /var/www/html/index.html
          owner: apache2
          group: apache2
          mode: '0644'
      - name: "Add a new line"
        ansible.builtin.copy:
          content: 'Hello World!, It is a custom site'
          dest: /var/www/html/index.html
  ```
- Execute playbook
  ```
  ansible-playbook -i web-inventory copy.yml
  ```

#### Reference:
- Visit Ansible [official doc](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/copy_module.html) for more examples
