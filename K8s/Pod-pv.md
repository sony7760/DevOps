## About
This is an example pod which consume the volume crated by [PV](./Pv.md)

#### Example
- Create a pod with the configurations given below,
  ```
  vim mypod-pv.yml
  ```
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: mypod-pv
  spec:
    containers:
      - name: myfrontend
        image: nginx:1.14.2
        volumeMounts:
        - mountPath: "/var/www/html"
          name: mypv
    volumes:
      - name: mypv
        persistentVolumeClaim:
          claimName: mypvc
  ```
  ```
  kubectl create -f mypod-pv.yml
  ```
- Verify volume
  ```
  kubectl exec -it mypod-pv -- /bin/bash
  ```
  ```
  cd /var/www/html
  ```
  ```
  touch /var/www/html/index.html
  ```
  ```
  echo "Hello, World" > /var/www/html/index.html
  ```
  ```
  exit
  ```
-  Check index.html on node(where you created the directory "/mnt/disks/ssd1/")
