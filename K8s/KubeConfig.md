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
- Add new user(myuser) into the config
  ```
  kubectl --kubeconfig myuser-config config set-credentials myuser --client-key=myuser.key --client-certificate=myuser.crt --embed-certs=true
  ```
  ```
  kubectl --kubeconfig myuser-config config set-context myuser --cluster=kubernetes --user=myuser
  ```
  ```
  kubectl --kubeconfig myuser-config config use-context myuser
  ```
