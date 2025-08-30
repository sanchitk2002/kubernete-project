# KIND Cluster Setup Guide
## 1. Installing KIND and kubectl
Install Docker, KIND and kubectl using the provided [script](https://github.com/sanchitk2002/kubernete-project/blob/main/kind/kind%2C%20kubectl%20%26%20docker-installation.sh):

## 2. Setting Up the KIND Cluster
Create a kind-config.yaml file.
<pre>
  kind: Cluster 
  apiVersion: kind.x-k8s.io/v1alpha4 
  nodes: 
  - role: control-plane 
    image: kindest/node:v1.33.1 
  - role: worker 
    image: kindest/node:v1.33.1 
  - role: worker 
    image: kindest/node:v1.33.1</pre>
