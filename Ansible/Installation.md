## About
Ansible is an open-source tool and also it is packaged and maintained by the community for a variety of Linux distributions.

#### Install on ubuntu
- Follow below steps to install ansible on Ubuntu  distro,
  ```
  apt update
  ```
  ```
  apt install software-properties-common -y
  ```
  ```
  add-apt-repository --yes --update ppa:ansible/ansible
  ```
  ```
  apt install ansible -y
  ```
- Verify installation
  ```
  ansible --version
  ```

#### Reference
- Follow the official [Ansible doc](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu) to see more installation options
