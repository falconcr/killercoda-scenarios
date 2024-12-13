# Restore the etcd Cluster

## 1. Verify the available backup
Ensure you have a valid etcd backup file, typically in .db or .snap format. Verify its integrity using:


`ETCDCTL_API=3 etcdctl snapshot status /tmp/etcd-backup.db`

## 2. Stop the etcd Pod
Since the etcd Pod is managed by the kubelet, which auto-restarts it, you need to temporarily disable it.

Move the manifest file out of the directory:

`mv /etc/kubernetes/manifests/etcd.yaml /tmp/`

> 🛑Relax🛑: We move the etcd.yaml manifest file to a different location to temporarily stop the etcd Pod, which is managed by the kubelet

Verify that the etcd Pod has stopped:

`kubectl get pods -n kube-system | grep etcd`

## 3. Restore the backup
Use etcdctl to restore the snapshot.

```
ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db \
  --data-dir=/var/lib/etcd-restored
```
This creates a restored etcd data directory at /var/lib/etcd-restored.

## 4. Update the etcd manifest
Modify the /etc/kubernetes/manifests/etcd.yaml file to point to the restored data directory.

Edit the hostPath in the etcd-data volume: Update the path to /var/lib/etcd-restored:

```yaml
  - name: etcd-data
    hostPath:
      path: /var/lib/etcd-restored
      type: DirectoryOrCreate
```

Move the manifest back:

`mv /tmp/etcd.yaml /etc/kubernetes/manifests/`

The kubelet will automatically restart the etcd Pod with the updated configuration.

> 🛑Take a break🛑: The Kubernetes API will be unavailable until the etcd pod is restarted. This may take up to 3 minutes.

## 5. Verify etcd health
After the kubelet restarts the etcd Pod:

Check the etcd Pod logs:

`kubectl logs -n kube-system etcd-<node-name>` 

Verify etcd cluster health:

```
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key endpoint health
```

Let's see if the _kube-proxy_ daemonset has been restored with the command

`kubectl get ds -n kube-system`

```
NAME         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
canal        2         2         2       2            2           kubernetes.io/os=linux   7d7h
kube-proxy   2         2         2       2            2           kubernetes.io/os=linux   7d7h
```

YOU ARE MY HERO! ALL IS BACK!

# Final Notes

- For multi-node clusters, ensure the restored state is propagated correctly.
- Backup the original etcd manifest before making any changes.
- Ensure the certificates and keys match the configuration in the etcd Pod manifest.
