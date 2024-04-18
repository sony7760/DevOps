## About
Install curl command on Ubuntu

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
  vim curl-install.yml
  ```
  ```
  # Install curl on web host
  ---
  - name: Install curl
    hosts: web
    remote_user: root
    become: no

    tasks:
    - name: Ensure curl is at the latest version
      ansible.builtin.apt:
        name: curl
        update_cache: yes
        state: latest
  ```
- Execute playbook
  ```
  ansible-playbook -i web-inventory curl-install.yml
  ```
