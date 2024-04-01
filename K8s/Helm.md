## Helm
[Helm](https://helm.sh/?ref=8grams.tech) is a package manager for Kubernetes, which simplifies the deployment and management of applications on a cluster

### Installation
Download the latest/stable release of the helm binary
- Identify the latest release by browsing the URL given below
  ```
  https://github.com/helm/helm/releases
  ```
- Set the variable HELM_VERSION to the desired version
  ```
  export HELM_VERSION=3.14.3
  ```
  ```
  echo $HELM_VERSION
  ```
- Download the helm binary
  ```
  wget -q https://get.helm.sh/helm-"${HELM_VERSION}"-linux-amd64.tar.gz -O - |tar -xzO linux-amd64/helm >/usr/local/bin/helm
  ```
- Set executable permission(For all) on helm command
  ```
  chmod a+x /usr/local/bin/helm
  ```
