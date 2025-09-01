# KIND Cluster Setup Guide
## 1. Installing KIND and kubectl
Install Docker, KIND and kubectl using the provided [script](https://github.com/sanchitk2002/kubernete-project/blob/main/installation%20script/install.sh):

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
```yaml
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
Apply the pod manifest file
```
kubectl apply -f pod.yml
```
To enter the pod terminal 
```
kubectl exec -it nginx-pod -n nginx -- bash
```
# Deployment
```yaml
kind: Deployment
apiVersion: apps/v1
metadata:
  name: nginx-deployment
  namespace: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      name: nginx-dep-pod
      labels:
        app: nginx

    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
Run the deployment.yml
```
kubectl apply -f deployment.yml
```

To scale the deployments
```
kubectl scale deployment/nginx-deployment -n nginx --replicas=1      #change replicas according to traffic
```
Replicaset.yml
difference between replicaset and deployment is rollout update which deployment can do and replica can't
```yaml
kind: ReplicaSet
apiVersion: apps/v1
metadata:
  name: nginx-replicasets
  namespace: nginx
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx

  template:
    metadata:
      name: nginx-rep-pod
      labels:
        app: nginx

    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```
  
