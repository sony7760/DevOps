## Kubernetes Roles
Roles are a type of K8s object(resource) that define a set of permissions within a namespace. It is typically associated with Users/Service Accounts, allowing them to perform certain operations based on the permissions defined in the Role

### Create Role
Role can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create role <role_name> --verb={permission-1} --verb={permission-2} --resource={resource_name}
- Example
  - create the role named devloper with create, get, list, update and delete permissions to access the pod resources
  ```
  kubectl create role devloper --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods
  ```
- Verify roles
  ```
  kubectl get roles
  ```
### OR
**Declerative:**
- Create a definition file
```
root@k8snode:~# vim developer.yml
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
