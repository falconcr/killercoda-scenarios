In this step, we'll update the control plane node to version 1.31.2.

### Verify the kubeadm version
kubeadm version

This command checks that your cluster can be upgraded, and fetches the versions you can upgrade to. It also shows a table with the component config version states:

```plain
kubeadm upgrade plan
```{{exec}}

If everything looks good and the upgrade plan is correct, you can proceed with upgrading the Kubernetes cluster.

<br>
<details><summary>Solution</summary>
<br>

```plain
kubeadm upgrade apply v1.31.2
```{{exec}}

After updating kubeadm, you should also update kubectl and kubelet on your cluster nodes.

Prepare the node for maintenance by marking it unschedulable and evicting the workloads:

```plain
kubectl drain node01 --ignore-daemonsets
```{{exec}}

Upgrade the kubelet and kubectl:
```plain
sudo apt-mark unhold kubelet kubectl && \
sudo apt-get update && sudo apt-get install -y kubelet='1.31.2-1.1' kubectl='1.31.2-1.1' && \
sudo apt-mark hold kubelet kubectl
```{{exec}}

Restart the kubelet:
```plain
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```{{exec}}

Bring the node back online by marking it schedulable:
```plain
kubectl uncordon node01
```
Verify that the worker node was updated to 1.31.2:

```bash
kubectl get nodes
```

```bash
NAME           STATUS   ROLES           AGE    VERSION
controlplane   Ready    control-plane   6d7h   v1.31.2
node01         Ready    <none>          6d6h   v1.31.2
```
</details>