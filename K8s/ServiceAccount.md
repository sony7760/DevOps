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
  kubectl create serviceaacount my-svc-account
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
### Create ClusterRole
- Follow the [link](./ClusterRole.md) to create a ClusterRole for the service account
