# Create a pod with a toleration
Open the file `pod-with-toleration.yaml` and add the toleration that allows to schedule the pod in node01. Don't forget to apply the file in the cluster. 

<br>
<details><summary>Solution</summary>
<br>

The final `pod-with-toleration.yaml` file should look like this:

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-toleration
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "dedicated"
    operator: "Equal"
    value: "cloudstation"
    effect: "NoSchedule"


```

</details>

