In this step, we'll update the control plane node to version 1.31.2.

# Verify the kubeadm version
kubeadm version

Ensure that the nodes are ready for the upgrade by running:

```plain
kubeadm upgrade plan
```{{exec}}

If everything looks good and the upgrade plan is correct, you can proceed with upgrading the Kubernetes cluster.

<br>
<details><summary>Solution</summary>
<br>

```plain
# Update kubeadm on the control plane node
sudo apt-get update && sudo apt-get install -y kubeadm=1.31.2-1.1
```{{exec}}

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
```


</details>