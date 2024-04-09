## Pod
A Pod is the smallest deployable unit that represents one or more containers running together on a Kubernetes cluster. A Pod encapsulates an application's container(s), storage resources, and a unique network IP, and it represents a single instance of a running process in the cluster

### Create pod
Pod can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl run {pod_name} image={container_image}
- Example
  - create the pod named myapp
  ```
  kubectl run myapp --image=nginx --namespace default
  ```
- Verify pod
  ```
  kubectl get pods -n  default
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
    name: myapp
    namespace: default
  spec:
    containers:
    - name: myapp-container
      image: nginx:1.14.2
      ports:
      - containerPort: 80
  ```
  ```
  kubectl create -f my-pod.yml
- Verify pod
  ```
  kubectl get pods -n  default
  ```
