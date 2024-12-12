# Simulate a Cluster Failure

Simulate a failure by stopping the etcd pod or deleting its data.

- Stop the etcd process on the control plane node.
- Remove the etcd data directory.

<br>
<details><summary>Solution</summary>
<br>

```bash
systemctl stop etcd

rm -rf /var/lib/etcd

```{{exec}}
Warning: Removing the etcd data directory will simulate a complete failure of etcd.
</details>