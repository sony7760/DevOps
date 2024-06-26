## Service Account Token
Service account tokens are created by default when you create a service account. However, there are a few scenarios where service account tokens may not be created automatically

### Create Token
Token can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create token {service_account_name}
- Example
  - create the token for service account [my-svc-account](./ServiceAccount.md)
  ```
  kubectl create token my-svc-account
  ```
- Verify service  accounts
  ```
  kubectl describe serviceaccount my-svc-account
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim my-service-account-token.yml
  ```
  ```
  apiVersion: v1
  kind: Secret
  metadata:
    name: my-service-account-token
    annotations:
      kubernetes.io/service-account.name: my-svc-account
  type: kubernetes.io/service-account-token
  ```
  ```
  kubectl create -f my-service-account-token.yml
  ```
  ```
  kubectl describe serviceaccount my-svc-account
  ```
