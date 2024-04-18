## About
PersistentVolumes provide a way to manage durable storage resources in Kubernetes and enable stateful applications to store and access data persistently across Pod restarts and reschedules

#### Create Persistent Volume(PV)
- Create a pv.yml file using local-storage option. In kubernetes, there are many [persistent volume types](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#types-of-persistent-volumes) available
  ```
  vim pv.yml
  ```
  ```
  apiVersion: v1
  kind: PersistentVolume
  metadata:
    name: mypv
  spec:
    capacity:
      storage: 200Mi
    volumeMode: Filesystem
    accessModes:
    - ReadWriteOnce
    storageClassName: local-storage
    local:
      path: /mnt/disks/ssd1
    nodeAffinity:
      required:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/hostname
            operator: In
            values:
            - node2
  ```
  ```
  kubectl create -f pv.yml
  ```
- Login to the worker node(in this case, it is node2) and create directory
  ```
  mkdir -p /mnt/disks/ssd1
  ```
- Check [PVC](./Pvc.md) doc for claiming the persistent volume for pod
