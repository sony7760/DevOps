## Deployment
In Kubernetes, a Deployment is an object that manages the lifecycle and scaling of a set of identical Pods. Deployments enable you to declaratively define and manage the desired state of your application, including how many replicas of the application should be running, what Pod template to use, and how to perform updates and rollbacks

### Create deployment
Deployment can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create {deployment_name} --image={image_name} --replicas={replica_count} --port={port_number}
- Example
  - Create a deployment named my-dep that runs the nginx image with 2 replicas
  ```
  kubectl create deployment my-dep --image=nginx --replicas=2 
  ```
- Verify deployment
  ```
  kubectl get deployments -n  default
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim my-deployment.yml
  ```
  ```
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: my-dep
    labels:
      app: nginx
  spec:
    replicas: 2
    selector:
      matchLabels:
        app: nginx
    template:
      metadata:
        labels:
          app: nginx
      spec:
        containers:
        - name: nginx
          image: nginx:1.14.2
          ports:
          - containerPort: 80
  ```
  ```
  kubectl create -f my-deployment.yml
- Verify deployments
  ```
  kubectl get deployments -n  default
  ```
#### Reference
- Official [doc](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-deployment-em-) for imperative method
- Official [doc](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for declerative method
