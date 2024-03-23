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
- Add all node hostnames and ip address to the /etc/hosts file of the each node.
  ```
  vim /etc/hosts
  ```
  ```
  192.168.56.21  master            ## `ip addr show` command  can be used see ip address of the node/s
  192.168.56.22  node1
  ```
- Disable swap memory
  ```
  free -m
  ```
  ```
  vim /etc/fstab                     
  ```
  ```
  #/swap.img	none	swap	sw	0	0      ## Comment the line of the swap
  ```
  ```
  swapoff -a
  ```
  ```
  free -m
  ```
- Load the required kernel modules
  ```
  lsmod | grep 'overlay\|br_netfilter'
  ```
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
  ```
  lsmod | grep 'overlay\|br_netfilter'
  ```
- Configure the kernel parameters
  ```
  sysctl -a | grep -E 'net.ipv4.ip_forward|net.bridge.bridge-nf-call-iptables|net.bridge.bridge-nf-call-ip6tables'
  ```
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
  ```
  sysctl -a | grep -E 'net.ipv4.ip_forward|net.bridge.bridge-nf-call-iptables|net.bridge.bridge-nf-call-ip6tables'
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
    mkdir -p -m 755 /etc/apt/keyrings
    ```
    ```
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    ```
  - Add the Kubernetes apt repository for the version 1.29
    ```
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    ```
  - Follow the [doc](../Troubleshoot/certificate_issuer_is_unknown.md) if **SSL Error(Certificate Unknown Issuer)** encountered
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
  ```
  ```
  systemctl start docker              ## Start docker service if not running
  ```
- Change containerd configs
  - Change the **SystemdCgroup=false** to **true** in the config.toml file. Follow the below coomands to create config.toml if doesn't exist it.
  ```
  mkdir -p /etc/containerd            ## Create directory if /etc/containerd/config.toml doesn't exist
  ```
  ```
  containerd config default | sudo tee /etc/containerd/config.toml
  ```
  ```
  grep SystemdCgroup /etc/containerd/config.toml
  ```
  ```
  sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
  ```
  ```
  grep SystemdCgroup /etc/containerd/config.toml
  ```
  ```
  systemctl restart containerd
  ```
### Install Kubernetes packages
- Install kubeadm, kubelet, kubectl
  ```
  apt-get install -y kubelet kubeadm kubectl
  ```
  ```
  systemctl enable --now kubelet     ## Enable kubelet service
  ```
### Configure Kubelet
- Add a line to disable read swap by kubelet
  ```
  sed '5!d' /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
  ```
  ```
  sed -i '5 i Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"' /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
  ```
  ```
  awk 'NR==5'  /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
  ```
- Create new 10-kubeadm.conf file if doesn't exist
  ```
  mkdir -p  /usr/lib/systemd/system/kubelet.service.d/
  ```
- Copy content of the [file](./10-kubeadm.conf) to 10-kubeadm.conf
  ```
  vim 10-kubeadm.conf
  ```

### Initialize Master(primary control-plane) node
- Initialize the cluster includes the cluster network option
  ```
  kubeadm init --apiserver-advertise-address=192.168.56.21 --control-plane-endpoint=master --upload-certs --pod-network-cidr=10.12.0.0/16
  ```
  - Check [file](./kubeadm_init_output.md) to see the ouput when the initialization is succeed 
- Configure kubectl on master node to access your cluster. **Note:-** kubectl utility can be used from any of the machine(which should have network connectivity to cluster) outside the cluster by copying the certs.
  ```
  mkdir -p $HOME/.kube
  ```
  ```
  cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  ```
  ```
  chown $(id -u):$(id -g) $HOME/.kube/config
  ```
- Visit k8s [addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/) page to apply appropriate CNI
  ```
  abc
  ```
### Join secondary Control-plane nodes (Optional)
- Check your kubeadm initialization output to copy the exact command. The command given below is an example
```
kubeadm join master:6443 --token gx4zxy.mjvgj2h7oack4p4d --discovery-token-ca-cert-hash sha256:68569efa81a722046d71e2a73dbea5166d018a20975b3c2b3aea7d5e89245a92 --control-plane --certificate-key 2c545aef5d638f70144b56bfbdc13ed712c279ef7da4974f71c14332c3b103bf
```
### Join any number of worker nodes
- Check your kubeadm initialization output to copy the exact command. The command given below is an example
```
kubeadm join master:6443 --token gx4zxy.mjvgj2h7oack4p4d --discovery-token-ca-cert-hash sha256:68569efa81a722046d71e2a73dbea5166d018a20975b3c2b3aea7d5e89245a92
```
