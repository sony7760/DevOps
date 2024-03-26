## RoleBinding
To apply a [Role](./Roles.md) to a User/Service Account, administrators need to create a RoleBinding, which establish the association between the Role and the User/Service Account within a namespace.

### Create RoleBinding
Rolebinding can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create rolebinding <rolebinding_name> --role=<role_name> --user=<user_name>
- Example
  - create the rolebinding named developer-binding-myuser to assign to the user [myuser](/User.md)
  ```
  kubectl create rolebinding developer-binding-myuser --role=developer --user=myuser
  ```
- Verify role bindings
  ```
  kubectl get rolebindings
  ```
### OR
**Declerative:**
- Create a definition file
```
root@k8snode:~# vim developer-binding-myuser.yml
```
```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: developer-binding-myuser
  namespace: default
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: developer
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: myuser
```
```
kubectl create -f developer-binding-myuser.yml
