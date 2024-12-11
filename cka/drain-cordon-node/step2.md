Evict all pods currently running on node01.

Once you've confirmed that no pods are running on node01, re-enable pod scheduling on the node.

<br>
<details><summary>Solution</summary>
<br>

```bash
# evict the pods that are running on node01
kubectl drain node01 --ignore-daemonsets

# verify that there are no pods running on node01
kubectl get pods -o wide | grep node01

# mark the node scheduleable once again
kubectl uncordon node01


```{{exec}}