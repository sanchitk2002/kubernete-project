#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail

# ----------------------------
# 1. Install Docker
# ----------------------------
echo "📦 Installing Docker..."
sudo apt-get update
sudo apt-get install -y docker.io

echo "👤 Adding current user to docker group..."
sudo usermod -aG docker "$USER"

echo "✅ Docker installed and user added to docker group."

# ----------------------------
# 2. Install Kind (based on architecture)
# ----------------------------
echo "📦 Installing Kind..."

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind

echo "✅ Kind installed successfully."

# ----------------------------
# 3. Install kubectl (latest stable)
# ----------------------------
echo "📦 Installing kubectl (latest stable version)..."

curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm -f kubectl

echo "✅ kubectl installed successfully."

# ----------------------------
# 4. Confirm Versions
# ----------------------------
echo
echo "🔍 Installed Versions:"
docker --version
kind --version
kubectl version --client --output=yaml

echo
echo "🎉 Docker, Kind, and kubectl installation complete!"


