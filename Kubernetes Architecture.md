# Kubernetes Architecture Explained

This document explains the key components that make up the architecture of a Kubernetes cluster, in simple terms.

## Table of Contents

- [Control Plane (Master Node Components)](#control-plane-master-node-components)
- [Worker Node Components](#worker-node-components)
- [Other Components](#other-components)

---

![Kubernetes Architecture Diagram](https://miro.medium.com/v2/resize:fit:1400/1*0Sudxeu5mQyN3ahi1FV49A.png)


## Control Plane (Master Node Components)

### API Server

This is the "front desk" of Kubernetes. Whenever you want to interact with your cluster, your request goes through the API Server. It validates and processes these requests to the backend components.

### etcd

Think of this as the "database" of Kubernetes. It stores all the information about your cluster—what nodes are part of the cluster, what pods are running, what their statuses are, and more.

### Scheduler

The "event planner" for your containers. When you ask for a container to be run, the Scheduler decides which machine (Node) in your cluster should run it. It considers resource availability and other constraints while making this decision.

### Controller Manager

Imagine a bunch of small robots that continuously monitor the cluster to make sure everything is running smoothly. If something goes wrong (e.g., a Pod crashes), they work to fix it, ensuring the cluster state matches your desired state.

### Cloud Controller Manager

This is a specialized component that allows Kubernetes to interact with the underlying cloud provider, like AWS or Azure. It helps in tasks like setting up load balancers and persistent storage.

---
