# Create a StorageClass named log-storage-class

- Create a StorageClass named log-storage-class that uses the `rancher.io/local-path`, it must be saved in the `$HOME/storage-class-exam.yaml` location. 
- Configure the StorageClass to provision volumes in the /data/logs directory.

<br>
<details><summary>Solution</summary>
<br>

```bash
cat <<EOF > $HOME/storage-class-exam.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: log-storage-class
provisioner: rancher.io/local-path
volumeBindingMode: WaitForFirstConsumer
parameters:
  path: "/data/logs"
EOF


```{{exec}}

kubectl apply -f storage-class-exam.yaml

</details>