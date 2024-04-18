## About
Write an ansible ad-hoc command to check uptime

#### Examples
- Create an inventory file
  ```
  vim uptime-inventory
  ```
  ```
  [db]
  192.168.56.27
  [web]
  192.168.56.26
  ```
- Execute ad-hoc command to check uptime on all nodes
  ```
  ansible -i uptime-inventory all -m command -a uptime
  ```
- Execute ad-hoc command to check uptime on web node
  ```
  ansible -i uptime-inventory web -m command -a uptime
  ```
