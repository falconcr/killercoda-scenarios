It is recommended to update kubeadm first before applying a new version of Kubernetes (K8s) to your cluster. This is because kubeadm is the tool responsible for managing the configuration and upgrade of the cluster, and updating it ensures you are using the latest commands and best practices to perform the upgrade safely and efficiently. 



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

Update the kubeadm:

```plain
sudo apt-get update && sudo apt-get install -y kubeadm=1.31.2-1.1
kubeadm version
```{{exec}}

After confirming that `kubeadm` is installed on both nodes, proceed to log out of `node01`.

```plain
exit
```{{exec}}
</details>
