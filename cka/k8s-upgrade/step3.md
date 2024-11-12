You'll take on the task of upgrading the control plane node to Kubernetes version 1.31.2. This upgrade is essential to keep your cluster aligned with the latest features, performance improvements, and security enhancements. By mastering this process, you'll build confidence in maintaining and updating Kubernetes environments.

Your challenge: Update the control plane node to version 1.31.2. This is more than just a version change—it's about ensuring your control plane is resilient and optimized. Are you ready to take on this upgrade and elevate your Kubernetes expertise?

### Verify the kubeadm version

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
kubectl drain controlplane --ignore-daemonsets
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
kubectl uncordon controlplane
```{{exec}}

Verify that the controlplane was updated to 1.31.2:

```plain
kubectl get nodes
``````{{exec}}

```bash
NAME           STATUS   ROLES           AGE    VERSION
controlplane   Ready    control-plane   6d7h   v1.31.2
node01         Ready    <none>          6d6h   v1.31.0
```
</details>