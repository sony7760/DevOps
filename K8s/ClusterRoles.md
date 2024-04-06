## Kubernetes ClusterRoles
Cluster Roles are a type of K8s object(resource) that define a set of cluster-wide permissions. It is typically associated with Users/Service Accounts, allowing them to perform certain operations based on the permissions defined in the Cluster Role

### Create ClusterRole
ClusterRole can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create clusterrole <clusterrole_name> --verb={permission-1} --verb={permission-2} --resource={resource_name}
- Example
  - create the clusterrole named devloper with create, get, list, update and delete permissions to access the pod resources
  ```
  kubectl create clusterrole developer --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods
  ```
- Verify roles
  ```
  kubectl get clusterroles
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim developer-clusterrole.yml
  ```
  ```
  apiVersion: rbac.authorization.k8s.io/v1
  kind: ClusterRole
  metadata:
    name: developer
  rules:
  - apiGroups:
    - ""
    resources:
    - pods
    verbs:
    - create
    - get
    - list
    - update
    - delete
  ```
  ```
  kubectl create -f developer-clusterrole.yml
  ```
- Verify roles
  ```
  kubectl get clusterroles
  ```
### Reference
- *namespace* is omitted since the ClusterRoles are not namespaced
- Follow the [link](./ClusterRolesBindings.md) to create the **ClusterRoleBinding**
- [Thirdparty doc](https://medium.com/rahasak/kubernetes-role-base-access-control-with-service-account-e4c65e3f25cc)
