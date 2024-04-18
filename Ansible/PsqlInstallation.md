## About
Install postgresql databse server on Ubuntu

#### Installation step
- Add host to the /etc/hosts file
  ```
  192.168.56.250  db
  ```
- Create inventory file
  ```
  vim db-inventory
  ```
  ```
  [db]
  db	ansibile_host=192.168.56.250   ansible_connection=ssh  ansible_user=ubuntu
  ```
- Create playbook yml file for installing postgresql db
  ```
  vim postgresql-install.yml
  ```
  ```
  # Install PostgreSQL on db host
  - name: Install PostgreSQL
    hosts: db
    gather_facts: true
    become: true
    become_method: sudo
    tasks:
      - name: Add pgdg repo to sources.list.d
        lineinfile:
          path: /etc/apt/sources.list.d/pgdg.list
          line: "deb http://apt.postgresql.org/pub/repos/apt {{ ansible_distribution_release }}-pgdg main"
          create: true
      - name: Download PostgreSQL key and add it to system keyring
        apt_key:
          url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
          state: present
      - name: Update apt cache
        apt:
          update_cache: yes
      - name: Install PostgreSQL
        apt:
          name: postgresql
          state: present
  ```
- Execute playbook
  ```
  ansible-playbook -i db-inventory postgresql-install.yml --ask-pass
  ```
