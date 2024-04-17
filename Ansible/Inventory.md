## About
Inventory file is a list or group of managed nodes and it can be created in many formats. The most common formats are INI and YAML. The default location for this file is `/etc/ansible/hosts`. Using the `-i <path>` option, different inventory file can be used 

#### Example
- A basic INI `/etc/ansible/hosts` might look like this
  ```
  vim /etc/ansible/hosts
  ```
  ```
  mail.gloveline.com

  [webservers]
  www.gloveline.com
  app.gloveline.com

  [dbservers]
  masterdb.gloveline.com
  slavedb-1.gloveline.com
  slavedb-2.gloveline.com
  ```
  
- Here’s that same basic inventory file in YAML format
  ```
  vim  /etc/ansible/hosts.yml
  ```
  ```
  ungrouped:
    hosts:
      mail.gloveline.com:
  webservers:
    hosts:
      www.gloveline.com:
      app.gloveline.com:
  dbservers:
    hosts:
      masterdb.gloveline.com:
      slavedb-1.gloveline.com:
      slavedb-2.gloveline.com:
  ```

#### Refrence
  - Check [Ansible official](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups) doc for more details
