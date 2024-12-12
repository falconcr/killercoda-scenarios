# Apply a taint on node01

Make sure you have a node called node01 in your Kubernetes cluster. Apply a taint on the node01 node (`dedicated=cloudstation:NoSchedule`) so that no pods can be scheduled on it unless they have the corresponding toleration. 
Verify that the taint was successfully applied.

<br>
<details><summary>Solution</summary>
<br>

```bash
kubectl taint nodes node01 dedicated=cloudstation:NoSchedule

kubectl describe node node01 | grep Taints


```{{exec}}


</details>