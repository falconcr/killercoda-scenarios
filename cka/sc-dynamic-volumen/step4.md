#  Verify the PVC and Dynamic Provisioning

Verify that the PVC is bound to a dynamically provisioned PersistentVolume.

- Check if the PersistentVolumeClaim is bound:

```bash
kubectl get pvc
```{{exec}}

Example output:

```
NAME       STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS         AGE
log-pvc    Bound    pvc-12345abc  1Gi        RWO            log-storage-class   10s
```

- Verify the dynamically provisioned PersistentVolume:


`kubectl get pv`

Example output:

```
NAME          CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM            STORAGECLASS         AGE
pvc-12345abc  1Gi        RWO            Delete           Bound    default/log-pvc  log-storage-class    10s  
```   