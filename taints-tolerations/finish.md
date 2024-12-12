# Solution Summary:

- You applied a taint on node01 to prevent pods from being scheduled without the proper toleration.
- You created a pod with the appropriate toleration to allow it to be scheduled on node01.
- You verified that the pod was scheduled on node01 thanks to the toleration.

This challenge helps you practice using taints and tolerations to control the scheduling of pods on specific nodes in Kubernetes.