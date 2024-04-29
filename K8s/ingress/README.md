#### Ingress
The main steps to expose a service on a Kubernetes cluster(On-Premise) thru ingress,
- **Install MetalLB:** a load balancer, to redirect incoming traffic to the node hosting the pods. This is done by applying a [manifest](./metallb/metallb.yaml) to create the necessary components in the cluster, including the controller and speaker pods
- **IPAddressPool:** Create an IPAddressPool, [which](./metallb/ip-adress-pool.yaml) specifies the range of IP addresses that the load balancer can use
- **Ingress Controller:** Install Nginx Ingress Controller to handle external traffic and load balance it to reach the various pods in the cluster. This is done by applying a [YAML file](./contoller/controller-deploy.yaml) to deploy the controller
