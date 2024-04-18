## About
Write an ansible ad-hoc ping command to ping all servers from inventory file

#### Example
- Create inventory file
  ```
  vim ping-inventory
  ```
  ```
  [db]
  192.168.56.27
  [web]
  192.168.56.26
  [all]
  192.168.56.27
  192.168.56.26
  127.0.0.1
  ```
- Execute ad-hoc command to ping all servers
  ```
  ansible -i ping-inventory all -m ping --ask-pass
  ```
- Execute ad-hoc command to ping db server
  ```
  ansible -i ping-inventory db -m ping --ask-pass
  ```
