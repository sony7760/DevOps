## About
A Kubernetes persistent volume (PV) is an object that allows pods to access persistent storage on a storage device, defined via a Kubernetes StorageClass.
A PV is a resource object in a Kubernetes cluster which continues to exist even after the pods using it have been destroyed. PVs must be requested through persistent volume claims (PVCs), which are requests for storage.

#### Create persistent volume claim(PVC)
- Create a persistent volume claim to access a persistent volume
  ```
  vim pvc.yml
  ```
  ```
  apiVersion: v1
  kind: PersistentVolumeClaim
  metadata:
    name: mypvc
  spec:
    accessModes:
      - ReadWriteOnce
    volumeMode: Filesystem
    resources:
      requests:
        storage: 200Mi
    storageClassName: local-storage
  ```
  ```
  kubectl create -f pvc.yml
  ```
- Create a [pod](./Pod-pv.md) to access the persistent volume
