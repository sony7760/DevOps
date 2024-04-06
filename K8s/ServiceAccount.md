## ServiceAccount
Kubernetes identifies human users as User Accounts. However, RBAC policies can also govern the behavior of software resources, which Kubernetes identifies as Service Accounts

### Create serviceaccount
ServiceAccount can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create serviceaccount {service_account_name}
- Example
  - create the token for service account my-svc-account
    ```
    kubectl create serviceaccount my-svc-account
    ```
- Verify service  accounts
  ```
  kubectl get serviceaccounts
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim my-svc-account.yml
  ```
  ```
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    name: my-svc-account
    namespace: default
  ```
  ```
  kubectl create -f vim my-svc-account.yml
  ```
- Verify service  accounts
  ```
  kubectl get serviceaccounts
  ```
### Create Token
- Create new [token](./SaToken.md) for service account authentication

### Create Role/ClusterRole
- Follow the [link](./ClusterRoles.md) to apply a ClusterRole
  **OR**
- Refer the [link](./Roles.md) to create a Role

### Create RoleBinding/ClusterRoleBinding
- Follow the [link](./ClusterRoleBindings.md) to bind ClusterRole with the service account
  **OR**
- Refer the [link](./RoleBindings.md) to create a RoleBindings
### References
- [Official doc](https://kubernetes.io/docs/concepts/security/service-accounts/)
- [Thirdparty doc](https://medium.com/rahasak/kubernetes-role-base-access-control-with-service-account-e4c65e3f25cc)
