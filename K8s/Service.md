## Service
Services enable connection between Pods, allowing for seamless communication between different parts of an application or between different applications running in a Kubernetes cluster. Service selects Pods based on labels. Pods with matching labels are automatically included in the Service. Kubernetes supports different types of Services:
- **ClusterIP:** Exposes the Service on an internal IP within the cluster. This is the default type.
- **NodePort:** Exposes the Service on each Node's IP at a static port.
- **LoadBalancer:** Exposes the Service externally using a cloud provider's load balancer.
- **ExternalName:** Maps the Service to a DNS name.
### Create service
Service can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl expose {resource_name} --port={port_number} --target-port={target_port_number}
- Example
  - Create a service for an mydeploy deployment, which serves on port 80 and connects to the containers on port 8000
  ```
  kubectl expose deployment mydeploy --port=80 --target-port=8000
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
