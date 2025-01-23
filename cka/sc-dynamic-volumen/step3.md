# Create a pod
Now that we have created the storageclass and the persistentvolumeclaim resources in Kubernetes, let's create a pod that can use the volume.

Create a pod named pv-pod that uses the image nginx with a volume named pv-storage . Mount the volume inside the container at /usr/share/nginx/html and specify the pvc by it's name (plog-pvc ).

After you've created the pod, list all the pods in the default namespace.

<br>
<details><summary>Solution</summary>
<br>

```bash
cat <<EOF | k apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: pv-pod
spec:
  containers:
    - name: pv-container
      image: nginx
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: pv-storage
  volumes:
    - name: pv-storage
      persistentVolumeClaim:
        claimName: log-pvc
EOF

```{{exec}}

</details>