## Service
Services enable connection between Pods, allowing for seamless communication between different parts of an application or between different applications running in a Kubernetes cluster. Service selects Pods based on labels. Pods with matching labels are automatically included in the Service. Kubernetes supports different types of Services:
- **ClusterIP:** Exposes the Service on an internal IP within the cluster. This is the default type.
- **NodePort:** Exposes the Service on each Node's IP at a static port((default: 30000-32767)).
- **LoadBalancer:** Exposes the Service externally using a cloud provider's load balancer.
- **ExternalName:** Maps the Service to a DNS name.
### Create service
- Service can be created either using an imperative(command) method or declerative(manifest/defnition file) method
- Create a [deployment](./Deployment.md) for testing service

**Imperative:**
- Syntax:
  - kubectl expose {resource_name} --port={port_number} --target-port={target_port_number}
- Example
  - Create a service for the deployment resource `mydeploy`, which serves on port 80 and connects to the containers on port 8000
  ```
  kubectl expose deployment mydeploy --port=80 --target-port=8000
  ```
- Verify service
  ```
  kubectl get services -n  default
  ```
### OR
**Declerative:**
- Create a definition file for ClusterIP service
  ```
  vim my-service.yml
  ```
  ```
  apiVersion: v1
  kind: Service
  metadata:
    name: my-service
  spec:
    selector:
      app: my-dep
    ports:
      - protocol: TCP
        port: 80
        targetPort: 80
  ```
  ```
  kubectl create -f my-service.yml
- Verify service
  ```
  kubectl get services -o wide
  ```
  ```
  curl <service_ip:port>
  ```
- Create a definition file for Nodeport service
  ```
  vim nodeport.yml
  ```
  ```
  apiVersion: v1
  kind: Service
  metadata:
    name: my-npservice
  spec:
    type: NodePort
    selector:
      app: my-dep
    ports:
      - port: 80
        targetPort: 80
        nodePort: 30007
  ```
  ```
  kubectl create -f nodeport.yml
  ```
- Verify service outside of the cluster
  ```
  curl 192.168.56.27:30007
  ```
#### Notes
- These are the 3 things that will work
  ```
  curl <node-ip>:<node-port>
  curl <service-ip>:<service-port>
  curl <pod-ip>:<target-port>
  ```
  - You are inside the kubernetes cluster (you are a pod)
    ```
    <service-ip> and <pod-ip> and <node-ip> will work
    ```
  - You are on the node
    ```
    <service-ip> and <pod-ip> and <node-ip> will work
    ```
  - You are outside the node
    ```
    Only <node-ip:Nodeport> will work assuming that <node-ip:Nodeport> is reachable
    ```
#### Reference
- Official [doc](https://kubernetes.io/docs/concepts/services-networking/service/) for declerative service reference
- Official [doc](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#expose) for imperative service reference
