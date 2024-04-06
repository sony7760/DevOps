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
    - image: bibinwilson/docker-kubectl:latest
      name: kubectl
    serviceAccountName: my-svc-account
  ```
  ```
  kubectl create -f  satest.yml
  ```
  ```
  kubectl get pods
  ```
  **Note:** Follow the [link](./ServiceAccount.md) to create service account and neccessary roles/clusterroles
### Test Access
- Test a pod creation from satest pod
  ```
  kubectl exec -it satest -- kubectl run nginx --image=nginx
  ```
  ```
  kubectl get pods
  ```
