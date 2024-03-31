## Kubectl
It is a command-line tool used to interact with Kubernetes clusters. It is the primary interface for managing Kubernetes clusters, performing tasks such as deploying applications, inspecting cluster resources, debugging issues, and managing cluster configurations

### Installation
Download the latest release of the kubectl binary
- Identify the latest release by browsinhg the URL given below
  ```
  https://storage.googleapis.com/kubernetes-release/release/stable.txt
  ```
- Set the variable KUBE_VERSION to the latest release
  ```
  export KUBE_VERSION=$(curl https://storage.googleapis.com/kubernetes-release/release/stable.txt)
  ```
  ```
  echo $KUBE_VERSION
  ```
- Download the kubectl binary
  ```
  curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/"${KUBE_VERSION}"/bin/linux/amd64/kubectl
  ```
- Set executable permission(For all) on kubectl command
  ```
  chmod a+x /usr/local/bin/kubectl
  ```
