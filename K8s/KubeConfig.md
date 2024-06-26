## kubeconfig
**kubeconfig** is a configuration file used by the kubectl command-line tool to connect to Kubernetes clusters. It contains information about one or more clusters, authentication mechanisms, and other settings necessary for kubectl to communicate with the Kubernetes API server. By  default, the config file should be located under the home directory($HOME/.kube/config)

### Create config file
- Copy existing config(admin.conf) file
  ```
  cp /etc/kubernetes/admin.conf myuser-config
  ```
- Remove admin credentials
  ```
  kubectl --kubeconfig myuser-config config get-users
  ```
  ```
  kubectl --kubeconfig myuser-config config delete-user kubernetes-admin
  ```
  ```
  kubectl --kubeconfig myuser-config config get-contexts
  ```
  ```
  kubectl --kubeconfig myuser-config config delete-context kubernetes-admin@kubernetes
  ```
  ```
  kubectl --kubeconfig myuser-config config view
  ```
- Add new user([myuser](./User.md)) into the config
  ```
  kubectl --kubeconfig myuser-config config set-credentials myuser --client-key=myuser.key --client-certificate=myuser.crt --embed-certs=true
  ```
  ```
  kubectl --kubeconfig myuser-config config set-context myuser --cluster=kubernetes --user=myuser
  ```
  ```
  kubectl --kubeconfig myuser-config config use-context myuser
  ```
  ```
  kubectl --kubeconfig myuser-config config view
  ```
### Copy config to the desired user home directory
The config file can be copied to any location(remote/local)
- Copy to a local ubuntu user's home directory
  ```
  mkdir -p /home/ubuntu/.kube
  ```
  ```
  cp myuser-config /home/ubuntu/.kube/config
  ```
  ```
  chown -R ubuntu.ubuntu /home/ubuntu/.kube
  ```
- Copy to a remote(My server ip address is 192.168.56.22) ubuntu user's home directory
  ```
  ssh ubuntu@192.168.56.22 "mkdir -p ~/.kube"
  ```
  ```
  scp myuser-config ubuntu@192.168.56.22:~/.kube/config
  ```
  ```
  ssh ubuntu@192.168.56.22 "chown -R ubuntu.ubuntu ~/.kube"
  ```
### Test access
- Switch to the user ubuntu(local/remote)
  ```
  kubectl get pods
  ```
### Reference
- [Official-doc](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#add-to-kubeconfig)
- [Thirdparty-doc](https://aungzanbaw.medium.com/a-step-by-step-guide-to-creating-users-in-kubernetes-6a5a2cfd8c71)
