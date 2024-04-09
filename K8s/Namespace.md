## Namespace
A namespace is a virtual cluster or a logical partition within a Kubernetes cluster that enables multiple teams, or projects to share the same physical cluster resources while providing isolation, segmentation, and resource quota management

### Create Namespace
Namespace can be created either using an imperative(command) method or declerative(manifest/defnition file) method

**Imperative:**
- Syntax:
  - kubectl create ns {namespace_name}
- Example
  - create the namespace named helloword
  ```
  kubectl create ns helloword
  ```
- Verify namespace
  ```
  kubectl get ns
  ```
### OR
**Declerative:**
- Create a definition file
  ```
  vim my-ns.yml
  ```
  ```
  apiVersion: v1
  kind: Namespace
  metadata:
    name: jan2024
    labels:
      project: techmindz
  ```
  ```
  kubectl create -f my-ns.yml
- Verify pod
  ```
  kubectl get ns
  ```
