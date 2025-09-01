### Kubernetes

---

## **Core Concepts**

### Monolithic vs Microservices, Kubernetes Architecture

1. `kubectl cluster-info`  
   Display cluster information to understand the Kubernetes architecture.

### Setup On Local/AWS EC2

1. `kind create cluster --name=tws-cluster --config=config.yml`  
   Create a Kubernetes cluster using Kind with a specific configuration.([config.yml](https://github.com/sanchitk2002/kubernete-project/blob/main/kind-cluster/config.yml))
2. `kubectl config use-context kind-tws-cluster`  
   Switch the context to the Kind cluster.

### Kubectl and Pods

1. `kubectl get nodes`  
   List all nodes in the Kubernetes cluster.
2. `kubectl run nginx --image=nginx -n nginx`  
   Create a pod named nginx in the nginx namespace.
3. `kubectl describe pod nginx -n nginx`  
   Display detailed information about the nginx pod.

### Namespaces, Labels, Selectors, Annotations

1. `kubectl create namespace monitoring`  
   Create a namespace for monitoring resources.
2. `kubectl get namespace`  
   List all namespaces in the cluster.
3. `kubectl label namespace monitoring team=devops`  
   Add a label to the monitoring namespace.
4. `kubectl describe namespace monitoring`  
   Display detailed information about the monitoring namespace.

---

## **Workloads**

### Deployments

1. `kubectl apply -f deployment.yml`  
   Deploy a workload defined in `deployment.yml`.
2. `kubectl scale deployment nginx-deployment --replicas=3 -n nginx`  
   Scale the deployment to 3 replicas.

### StatefulSets

1. `kubectl apply -f statefulset.yml`  
   Deploy a StatefulSet defined in `statefulset.yml`.
2. `kubectl describe statefulset mysql -n database`  
   Display detailed information about a StatefulSet.

### DaemonSets

1. `kubectl apply -f daemonset.yml`  
   Deploy a DaemonSet for running pods on every node.
2. `kubectl describe daemonset fluentd -n logging`  
   Display details about a DaemonSet.

### ReplicaSets

1. `kubectl apply -f replicaset.yml`  
   Deploy a ReplicaSet for managing pod replicas.
2. `kubectl describe replicaset nginx-replicaset -n nginx`  
   Show detailed information about the ReplicaSet.

### Jobs and CronJobs

1. `kubectl apply -f job.yml`  
   Deploy a Job defined in `job.yml`.
2. `kubectl apply -f cronjob.yml`  
   Deploy a CronJob to schedule recurring tasks.

---
