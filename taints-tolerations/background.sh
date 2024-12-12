cat <<EOF > $HOME/pod-with-toleration.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-with-toleration
spec:
  containers:
  - name: nginx
    image: nginx
EOF