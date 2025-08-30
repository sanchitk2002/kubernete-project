#!/bin/bash

# installing kind
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind

# Installing kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mkdir -p ~/.local/bin
sudo mv ./kubectl ~/.local/bin/kubectl
kubectl version --client

rm -f kubectl
rm -rf kind

echo "kind and kubectl installation complete"
