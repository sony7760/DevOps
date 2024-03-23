## K8s Cluster
This cluster configuration includes a master node and a worker node.
### Prerequisites
- Privileged Access(root)
- Minimum 2GB RAM or more
- Minimum 2 CPU cores (or 2 vCPUs)
- 20 GB harddisk
- OS : Ubuntu 22.04.4
### Preparation
All of these steps given below is applicable for all the cluster nodes.
- Add all node hostnames and ip address to the /etc/hosts file of the each node. It looks like given below,
  ```
    vim /etc/hosts

    192.168.56.21  k8smaster
    192.168.56.22  k8snode1
  ```
- Disable swap memory
  ```
  vim /etc/fstab                        ## Comment the line of the swap

  #/swap.img	none	swap	sw	0	0
  ```
  ```
  swapoff -a
  ```
- Load the required kernel modules
  ```
  tee /etc/modules-load.d/containerd.conf <<EOF
  overlay
  br_netfilter
  EOF
  ```
  ```
  modprobe overlay
  ```
  ```
  modprobe br_netfilter
  ```
- Configure the kernel parameters
  ```
  tee /etc/sysctl.d/kubernetes.conf <<EOF
  net.bridge.bridge-nf-call-ip6tables = 1
  net.bridge.bridge-nf-call-iptables = 1
  net.ipv4.ip_forward = 1
  EOF
  ```
  ```
  sysctl --system                      ## Reload kernel parameters
  ```
- install packages needed to use the Kubernetes apt repository
  ```
  apt-get update
  ```
  ```
  apt-get install -y apt-transport-https ca-certificates curl gpg
  ```
- Add Kubernetes apt repository
  - Download the public signing key for the Kubernetes package repositories
    ```
    mkdir -p -m 755 /etc/apt/keyrings   ## Run this command if the dir `/etc/apt/keyrings` does not exist
    ```
    ```
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    ```
  - Add the Kubernetes apt repository for the version 1.29
    ```
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    ```
- Update apt repository
  ```
  apt-get update
  ```
### Install Container Runtime(Docker/Containerd/Rkt etc..)
- Install Docker package
  ```
  apt-get install docker.io -y
  ```
- Enable Docker to launch on boot
  ```
  systemctl enable docker
  ```
- Verify Docker is running
  ```
  systemctl status docker

  systemctl start docker              ## Start docker service if not running
  ```
- Change containerd configs
  - Change the **SystemdCgroup=false** to **true** in the config.toml file. Follow the below coomands to create config.toml if doesn't exist it.
  ```
  mkdir -p /etc/containerd            ## Create directory if /etc/containerd/config.toml doesn't exist

  containerd config default | sudo tee /etc/containerd/config.toml

  sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
  ```
### Install Kubernetes packages
- Install kubeadm, kubelet, kubectl
  ```
  apt-get install -y kubelet kubeadm kubectl
  ```
  ```
  systemctl enable --now kubelet     ## Enable kubelet service
  ```
### Configure Master(primary control-plane) node
- Initialize the cluster includes the cluster network option
  ```
  kubeadm init --apiserver-advertise-address=192.168.56.21 --control-plane-endpoint=k8smaster --upload-certs --pod-network-cidr=10.12.0.0/16
  ```
- Configure kubectl on master node to access your cluster. **Note:-** kubectl utility can be used from any of the machine(which should have network connectivity to cluster) outside the cluster by copying the certs.
  ```
  abc
  ```
