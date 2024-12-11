kubectl create ns cloudstationginx

kubectl -n cloudstationginx create deploy nginx --image nginx --replicas 6

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-