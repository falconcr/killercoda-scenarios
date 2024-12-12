# Verify the etcd Cluster
Verify the health of the etcd cluster to ensure it is running and operational. Use the kubectl command to check the status of the etcd pod running in the control plane.

- Log in to the control plane node.
- Verify the etcd pod is running.
- Use the etcdctl client to check the cluster health.

Expected Output: The etcd cluster should report as healthy.

<br>
<details><summary>Solution</summary>
<br>

```bash
kubectl get pods -n kube-system | grep etcd

ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key endpoint health

```{{exec}}

</details>
