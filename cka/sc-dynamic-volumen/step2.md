# Create the PersistentVolumeClaim

Create a PersistentVolumeClaim (PVC) named log-pvc with the following specifications:
- Storage size: 1Gi
- Access mode: ReadWriteOnce (RWO)
- Use the log-storage-class.

<br>
<details><summary>Solution</summary>
<br>

```bash
cat <<EOF > $HOME/pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: log-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
  storageClassName: log-storage-class
EOF


```{{exec}}

kubectl apply -f pvc.yaml

</details>