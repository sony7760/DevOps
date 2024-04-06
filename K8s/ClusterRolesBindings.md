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
  subjects:
  - kind: ServiceAccount
    name: my-svc-account # Name is case sensitive
    apiGroup: ""
    namespace: default
  roleRef:
    kind: ClusterRole
    name: developer
    apiGroup: rbac.authorization.k8s.io
  ```
  ```
  kubectl create -f developer-binding-my-svc-account.yml
  ```
- Verify ClusterRoleBindings
  ```
  kubectl get clusterrolebindings | grep "developer-binding-my-svc-account"
  ```
### References
- [Official doc](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_clusterrolebinding/)
- [Thirdparty doc](https://medium.com/rahasak/kubernetes-role-base-access-control-with-service-account-e4c65e3f25cc)
