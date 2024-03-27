## Service Account Token
service account tokens are created by default when you create a service account. However, there are a few scenarios where service account tokens may not be created automatically

### Create Token
Token can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create token {service_account_name}
- Example
  - create the token for service account my-svc-account
  ```
  kubectl create token my-svc-account
  ```
### OR
**Declerative:**
- Create a definition file
```
root@k8snode:~# vim my-svc-account.yml
```
```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: developer
  namespace: default
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
kubectl create -f developer.yml
```
- Verify roles
  ```
  kubectl get roles
  ```
