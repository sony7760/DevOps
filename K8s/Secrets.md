## Secrets
Secrets are objects used to store sensitive information such as passwords, API keys, and certificates. They provide a way to securely manage and distribute this data to pods in the cluster

### Create Secret
Secret can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create secret generic {secret_name} --from-literal=key1=value1 --from-literal=key2=value2
- Example
  - create the secret named mysecret
  ```
  kubectl create secret generic my-secret --from-literal=user=tom --from-literal=password=123456
  ```
- Verify secret
  ```
  kubectl get secrets
  ```
### OR
**Declerative:**
- Encode username and password using base64 command
  ```
  echo "tom" |base64
  ```
  ```
  echo "123456" |base64
  ```
- Create a definition file
  ```
  root@k8snode:~# vim my-secret.yml
  ```
  ```
  apiVersion: v1
  kind: Secret
  metadata:
    name: my-secret
    namespace: default
  type: Opaque
  data:
    user: dG9tCg==
    password: MTIzNDU2Cg==
  ```
  ```
  kubectl create -f my-secret.yml
  ```
- Verify secrets
  ```
  kubectl get secrets
  ```
