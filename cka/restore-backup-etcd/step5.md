# Verify the Restored Cluster

Verify that the etcd cluster is restored and healthy.

- Check the etcd health again.
- Verify that the cluster state matches the backup by checking Kubernetes resources.

<br>
<details><summary>Solution</summary>
<br>

```bash
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key endpoint health

kubectl get nodes

kubectl get pods -A
```{{exec}}

The etcd cluster should be healthy, and all Kubernetes resources should be restored.
</details>
