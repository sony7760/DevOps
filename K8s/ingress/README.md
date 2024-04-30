#### Ingress
Ingress is an K8s API object that helps expose applications and manage external access by providing http/s routing rules to the services within a Kubernetes cluster. The main steps to expose a service on a Kubernetes cluster(On-Premise) thru ingress are,
- **MetalLB:** a load balancer, to redirect incoming traffic to the node hosting the pods. This is done by applying a [manifest](./metallb/metallb.yaml) to create the necessary components in the cluster, including the controller and speaker pods
- **IPAddressPool:** Create an IPAddressPool, [which](./metallb/ip-adress-pool.yaml) specifies the range of IP addresses that the load balancer can use. Please note that you may need to assign the same range as your worker node’s Ip addresses
- **Ingress Controller:** Install Nginx Ingress Controller to handle external traffic and load balance it to reach the various pods in the cluster. This is done by applying a [YAML file](./contoller/controller-deploy.yaml) to deploy the controller
- **Ingress(HTTP/S Rules):** To access the backend service, we need create an [ingress resource](./manifests/demo_ingress.yaml) with the rules. Note that Ingress rules must reside in the namespace where the application reside.

#### Configure MetalLB
- Download a manifest file
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/metallb/metallb.yaml
  ```
- Deploy the manifest file
  ```
  kubectl apply -f metallb.yaml
  ```
- Validate that it has initialized Deployment(controller), Deamonset(speaker), and Service accounts with the RBAC permissions
  ```
  kubectl get  -n metallb-system
  ```

#### Configure IPAddressPool
- Download a manifest file
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/metallb/ip-adress-pool.yaml
  ```
- Deploy the manifest file
  ```
  kubectl apply -f ip-adress-pool.yaml
  ```
- Validate the IP pool range
  ```
  kubectl get IPAddressPool -n metallb-system
  ```

#### Configure Nginx Ingress Controller
- Download a manifest file
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/controller/controller-deploy.yaml
  ```
- Deploy the manifest file
  ```
  kubectl apply -f controller-deploy.yaml
  ```
- Validate the resources and make sure the service(Type: Loadbalancer) have External IP is associated(From the IpAddressPool range)
  ```
  kubectl get all -n ingress-nginx
  ```

#### Test
- Download deployments, services, and ingress yamls
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/manifests/deployment_service.yaml
  ```
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/manifests/demo_deployment_service.yaml
  ```
  ```
  curl -O https://raw.githubusercontent.com/sony7760/DevOps/main/K8s/ingress/manifests/demo_ingress.yaml
  ```
- Deploy the manifest files
  ```
  kubectl apply -f deployment_service.yaml
  ```
  ```
  kubectl apply -f demo_deployment_service.yaml
  ```
  ```
  kubectl apply -f demo_ingress.yaml
  ```
- Make sure the External Ip address(From the IpAddressPool) has assigned to ingress. Please note that it may take few minutes to assign  IP
  ```
  kubectl get ingress
  ```

#### Misc
- Add the ingress External IP address to your localhost's /etc/hosts file to browse the app
- Example:
  ```
  192.168.56.200  foo.bar.com
  ```
- Browse the URL paths for foo.bar.com/foo and foo.bar.com/bar
- Change index.html file content of each application to see the difference clearly

#### Reference
- Link to the [official doc](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- Link to the [third-party doc](https://medium.com/@tanmaybhandge/simplifying-service-exposure-in-on-premises-kubernetes-cluster-using-ingress-controller-39ed8cd9fa93)
