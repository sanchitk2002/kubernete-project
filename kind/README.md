# KIND Cluster Setup Guide
## 1. Installing KIND and kubectl
Install Docker, KIND and kubectl using the provided [script](https://github.com/sanchitk2002/kubernete-project/blob/main/kind/install.sh):

## 2. Setting Up the KIND Cluster
Create a kind-config.yaml file also known as cluster manifestation file
```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
    image: kindest/node:v1.33.1
  - role: worker
    image: kindest/node:v1.33.1
  - role: worker
    image: kindest/node:v1.33.1
    extraPortMappings:
    - containerPort: 80
      hostPort: 80
      protocol: TCP
    - containerPort: 443
      hostPort: 443
      protocol: TCP
```
Create the cluster using this config file 
```
kind create cluster --config kind-config.yaml --name sanchit-cluster
```

## Namesapce
For creating namespace.yml
```yaml
kind: Namespace
apiVersion: v1
metadata:
  name: nginx
```
Apply the namespace using this manifest fil above
```
kubectl apply -f namespace.yml
```

## Pod
```
kind: Pod
apiVersion: v1
metadata:
  name: nginx-pod
  namespace: nginx
spec:
 containers:
   - name: nginx
     image: nginx:latest
     ports:
       - containerPort: 80
```
