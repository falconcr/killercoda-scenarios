You'll focus on upgrading the worker node to Kubernetes version 1.31.2. Keeping worker nodes up to date is essential for maintaining overall cluster performance, compatibility, and security. This task will strengthen your skills in handling node-specific upgrades and managing a seamless Kubernetes environment.

Your challenge: Upgrade the worker node to version 1.31.2. This step is crucial to ensure that your worker node operates smoothly with the control plane. Are you prepared to tackle this upgrade and refine your Kubernetes management skills?

<br>
<details><summary>Solution</summary>
<br>

```plain
sudo kubeadm upgrade node
```{{exec}}

After updating kubeadm, you should also update kubectl and kubelet on your cluster nodes.


Prepare the node for maintenance by marking it unschedulable and evicting the workloads:

```plain
kubectl drain node01 --ignore-daemonsets
```{{exec}}

Connect via `ssh` to node01:

```plain
ssh node01
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

Come back to controlplane node and bring the node back online by marking it schedulable:
```plain
kubectl uncordon node01
```{{exec}}

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
