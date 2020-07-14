
### 安装king
```shell script
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
chmod +x ./kind
mv ./kind /some-dir-in-your-PATH/kind

#
kind create cluster --name kind-2

# 
kubectl cluster-info --context kind-kind-2
```

### 安装kuebctl
```shell script
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

```

### 安装 dashboard
```shell script

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```

### 
```shell script
#
kubectl apply -f yaml/registry.yaml
```

```shell script
kubectl apply -f yaml/deployment-nginx.yaml
kubectl apply -f yaml/service-nginx.yaml
kubectl expose deployment nginx-deployment --type=NodePort
```

```shell script
kubectl describe node kind

kubectl get deployment -o wide
```

```shell script
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
- kubeProxyMode: ipvs
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF
```