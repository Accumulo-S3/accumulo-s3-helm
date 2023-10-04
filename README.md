# create an accumulo namespace
`kubectl create ns accumulo`

# install zookeeper
`helm install zookeeper oci://registry-1.docker.io/bitnamicharts/zookeeper -n accumulo`

# connect to a manager pod
`kubectl exec --tty -i -n accumulo accumulo-manager-1 -- bash`

# connect to the dashboard
kubectl port-forward --namespace accumulo svc/accumulo-manager-0 9995:9995
