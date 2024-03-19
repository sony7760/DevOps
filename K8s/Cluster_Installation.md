## K8s Cluster
This cluster configuration includes a master node and a worker node.
#### Prerequisites
- Privileged Access(root)
- Minimum 2GB RAM or more
- Minimum 2 CPU cores (or 2 vCPUs)
- 20 GB harddisk
#### Preparation
All of these steps are applicable for all the cluster  nodes.
- Disable swap memory
  - vim /etc/fstab                        ## Comment out the line of swap
  - swapoff -a
- 
