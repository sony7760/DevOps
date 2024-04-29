#### Ingress
The main steps to expose a service on a Kubernetes cluster(On-Premise) thru ingress,
- **Install MetalLB:** a load balancer, to redirect incoming traffic to the node hosting the pods. This is done by applying a [manifest](./metallb/) to create the necessary components in the cluster, including the controller and speaker pods
