# Backup the etcd Cluster

Perform a backup of the etcd data and save it to a file.

- Use the etcdctl tool to create a snapshot.
- Verify that the snapshot file was created.

<br>
<details><summary>Solution</summary>
<br>

```bash
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /tmp/etcd-backup.db

ls -l /tmp/etcd-backup.db

```{{exec}}

Expected Output: The file /tmp/etcd-backup.db should exist and contain the etcd snapshot.

</details>

