## Pod
A Pod is the smallest deployable unit that represents one or more containers running together on a Kubernetes cluster. A Pod encapsulates an application's container(s), storage resources, and a unique network IP, and it represents a single instance of a running process in the cluster

### Create pod
Pod can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create secret generic {secret_name} --from-literal=key1=value1 --from-literal=key2=value2
- Example
  - create the secret named mysecret
  ```
  kubectl create secret generic my-secret --from-literal=user=tom --from-literal=password=123456
  ```
- Verify secret
  ```
  kubectl get secrets
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim my-pod.yml
  ```
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: nginx
  spec:
    containers:
    - name: nginx
      image: nginx:1.14.2
      ports:
      - containerPort: 80
  ```
  ```
  kubectl create -f my-pod.yml
