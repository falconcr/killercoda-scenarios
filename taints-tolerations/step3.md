# Verify if the pod is running on node01

Verify if the pod-with-toleration pod is running on node01

<br>
<details><summary>Solution</summary>
<br>

```bash
kubectl get pod pod-with-toleration -o wide

```{{exec}}

The output should show that the pod is scheduled on node01. If the pod is running on node01, it means the toleration worked correctly.

</details>