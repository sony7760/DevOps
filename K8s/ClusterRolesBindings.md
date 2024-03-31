## ClusterRoleBinding
To apply a [ClusterRole](./ClusterRoles.md) to a User/Service Account, the administrators need to create a ClusterRoleBinding, which establish the association between the ClusterRole and the User/Service Account cluster-wide.

### Create ClusterRoleBinding
ClusterRolebinding can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create clusterrolebinding <rolebinding_name> --role=<clusterrole_name> --serviceaccount=<namespace:serviceaccountname>
- Example
  - create the rolebinding named developer-binding-my-svc-account to assign to the service account [my-svc-account](/ServiceAccount.md)
  ```
  kubectl create clusterrolebinding developer-binding-my-svc-account --clusterrole=developer --serviceaccount=default:my-svc-account
  ```
- Verify role bindings
  ```
  kubectl get clusterrolebindings
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim developer-binding-my-svc-account.yml
  ```
  ```
  apiVersion: rbac.authorization.k8s.io/v1
  kind: ClusterRoleBinding
  metadata:
    name: developer-binding-my-svc-account
  roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: ClusterRole
    name: developer
  subjects:
  - apiGroup: rbac.authorization.k8s.io
    kind: ServiceAccount
    name: my-svc-account

  ```
  ```
  kubectl create -f developer-binding-my-svc-account.yml
  ```
- Verify ClusterRoleBindings
  ```
  kubectl get clusterrolebindings
  ```
