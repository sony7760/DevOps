## About
To test the permissions that assigned to the Service Account,  It can be deployed a pod and install kubectl command inside

### Create yaml file
- Create the definition file by declaring service account name
  ```
  vim satest.yml
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
  kubectl create -f  satest.yml
  ```
###  Install kubectl utility
- Login to the  pod
  ```
  kubectl exec -it satest -- /bin/bash
  ```
- Follow the [link](./Kubectl.md) to install **kubectl** utility
- Exit from satest pod
  ```
  exit
  ```
### Test Access
- Test a pod creation from satest pod
  ```
  kubectl exec -it satest -- kubectl run nginx --image=nginx
  ```
  ```
  kubectl get pods
  ```
