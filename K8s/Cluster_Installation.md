## K8s Cluster
This cluster configuration includes a master node and a worker node.
#### Prerequisites
- Privileged Access(root)
- Minimum 2GB RAM or more
- Minimum 2 CPU cores (or 2 vCPUs)
- 20 GB harddisk
- OS : Ubuntu 22.04.4
#### Preparation
All of these steps given below is applicable for all the cluster nodes.
- Add all node hostnames and ip address to the /etc/hosts file of the each node.
  - Example:-
    ```
    vim /etc/hosts

    192.168.56.1  k8smaster
    192.168.56.2  k8snode1
    ```
- Disable swap memory
  ```
  vim /etc/fstab                        ## Comment the line of the swap

  #/swap.img	none	swap	sw	0	0
  ```
  ```
  swapoff -a
  ```
- Run package/repository update
  ```
  apt-get update
  ```
#### Install Container Runtime(Docker/Containerd/Rkt etc..)
- 
