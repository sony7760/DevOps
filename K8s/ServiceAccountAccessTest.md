## About
To test the permissions that assigned to the Service Account,  It can be deployed a pod and install kubectl command inside

### Create yaml file
- Create the definition file by declaring service account name
  ```
  vim svcaccount-test.yml
  ```
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: satest
    namespace: default
  spec:
    containers:
    - image: nginx:1.14.2
      name: kubectl
    serviceAccountName: my-svc-account
  ```
  ```
  kubectl create -f  svcaccount-test.yml
  ```
###  Install kubectl utility
- Login to the  pod
  ```
  kubectl exec -it satest -- /bin/bash
  ```
