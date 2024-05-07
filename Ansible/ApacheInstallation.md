## About
Install apache2 web server on Ubuntu

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
  web	ansibile_host=192.168.56.251   ansible_connection=ssh  ansible_user=ubuntu ansible_become_pass=123456
  ```
  - Note that ansible_become_pass is the sudo password
- Create playbook yml file for installing apache2 web server
  ```
  vim apache-install.yml
  ```
  ```
  # Install apache on web host
  ---
  - name: Install web server
    hosts: web
    remote_user: ubuntu
    become: yes
    become_user: root

    tasks:
    - name: Ensure apache is at the latest version
      ansible.builtin.apt:
        name: apache2
        update_cache: yes
        state: latest
  ```
- Execute playbook (-kK will prompt for sudo password)
  ```
  ansible-playbook -i web-inventory apache-install.yml -kK
  ```
