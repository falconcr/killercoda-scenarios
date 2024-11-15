Before diving into a Kubernetes (K8s) version upgrade, start by updating kubeadm first. kubeadm is the backbone of your cluster's configuration and upgrade process, and by updating it, you're equipping yourself with the latest tools, commands, and best practices to ensure a safe and efficient upgrade. Are you ready to tackle this essential first step?



> **🔍 HINT**:  
> Find the latest patch release for Kubernetes 1.31 using the OS package manager:
> ```bash
> # Find the latest 1.31 version in the list.
> # It should look like 1.31.x-*, where x is the latest patch.
> sudo apt update
> sudo apt-cache madison kubeadm
> ```

<br>
<details><summary>Solution</summary>
<br>

```plain
sudo apt-get update && sudo apt-get install -y kubeadm=1.31.2-1.1
```{{exec}}

After updating, make sure you have the correct version of kubeadm installed:

```plain
kubeadm version -o json | jq
```{{exec}}

It is the time to update the kubeadm of the worker node. Connect via `ssh` to node01:

```plain
ssh node01
```{{exec}}

Update the kubeadm in the worker node:

```plain
sudo apt-get update && sudo apt-get install -y kubeadm=1.31.2-1.1
kubeadm version
```{{exec}}

After confirming that `kubeadm` is installed and updated on both nodes, proceed to log out of `node01`.

```plain
exit
```{{exec}}
</details>
