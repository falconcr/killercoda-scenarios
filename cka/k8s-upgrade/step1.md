# Step 1: Check the current Kubernetes version
First, check the current version of Kubernetes on your nodes.

```bash
kubeadm version -o json | jq
```

Ensure both nodes are running version 1.31.0 before proceeding.