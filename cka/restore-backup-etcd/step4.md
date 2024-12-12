# Restore the etcd Cluster

- Restore the etcd cluster using the backup file you created in Step 2.
- Use the etcdctl tool to restore the snapshot
- Update the etcd configuration to use the restored data directory if needed.
- Start the etcd process.
- Verify the etcd process is running.

<br>
<details><summary>Solution</summary>
<br>

```bash
ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db --data-dir=/var/lib/etcd

systemctl start etcd

kubectl get pods -n kube-system | grep etcd
```{{exec}}
</details>
