# Simulate a Cluster Failure

Now that we have successfully created a valid snapshot of etcd, let's simulate a disaster by modifying the cluster state. 

To do this, we’ll delete the `kube-proxy` daemonset located in the `kube-system` namespace:

```bash
kubectl delete ds kube-proxy -n kube-system
```

You can confirm that the `kube-proxy` daemonset has been removed by running:

```bash
kubectl get ds -A
```

Oh no! The `kube-proxy` daemonset is gone. How do we restore it? Luckily, we have a backup!

Click "Next" to restore the `kube-proxy` daemonset from our snapshot backup.