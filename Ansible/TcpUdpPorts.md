## About
Print all tcp/udp listening ports
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
- Create playbook yml file to print ports
  ```
  vim tcpudp-ports.yml
  ```
  ```
  # Print all listening ports(tcp/udp) on web host
  ---
  - gather_facts: true
    hosts: web

    tasks:
      - name: Collect Facts
        listen_ports_facts:

      - name: List TCP Ports
        debug:
          msg: "{{ tcp_listen }}"

      - name: List  UDP Ports
        debug:
          msg: "{{ udp_listen }}"
  ```
- Execute playbook
  ```
  ansible-playbook -i web-inventory tcpudp-ports.yml
  ```
