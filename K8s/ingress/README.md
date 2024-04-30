#### Ingress
Ingress is an K8s API object that helps expose applications and manage external access by providing http/s routing rules to the services within a Kubernetes cluster. The main steps to expose a service on a Kubernetes cluster(On-Premise) thru ingress are,
- **MetalLB:** a load balancer, to redirect incoming traffic to the node hosting the pods. This is done by applying a [manifest](./metallb/metallb.yaml) to create the necessary components in the cluster, including the controller and speaker pods
- **IPAddressPool:** Create an IPAddressPool, [which](./metallb/ip-adress-pool.yaml) specifies the range of IP addresses that the load balancer can use
- **Ingress Controller:** Install Nginx Ingress Controller to handle external traffic and load balance it to reach the various pods in the cluster. This is done by applying a [YAML file](./contoller/controller-deploy.yaml) to deploy the controller
- **Ingress(HTTP/S Rules):** To access the backend service, we need create an [ingress resource](./manifests/demo_ingress.yaml) with the rules. Note that Ingress rules must reside in the namespace where the application reside.

#### Configure MetalLB
- Create a manifest file
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/metallb/metallb.yaml
  ```
- Deploy the manifest file
  ```
  kubectl apply -f metallb.yaml
  ```
- Validate the deployment has initialized Deployment(controller), Deamonset(speaker), and Service accounts with the RBAC permissions
  ```
  kubectl get  -n metallb-system
  ```
