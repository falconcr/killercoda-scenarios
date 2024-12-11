The node node01 in the kubernetes cluster is facing memory leakage issues. To perform maintenance, start by disabling the scheduling of new pods on the node.
<br>
<details><summary>Solution</summary>
<br>

```bash
# mark the node01 unschedulable
kubectl cordon node01

# list the nodes to verify that node01 is unschedulable
kubectl get nodes


```{{exec}}


</details>