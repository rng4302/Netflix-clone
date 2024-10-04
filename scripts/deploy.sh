#!/bin/bash
# Deploys a microservice to Kubernetes.

set -u # or set -o nounset
: "${CONTAINER_REGISTRY:?Need to set CONTAINER_REGISTRY}"
: "${VERSION:?Need to set VERSION}"

# Echo the values to ensure they're being passed correctly
echo "Deploying images from: $CONTAINER_REGISTRY with version: $VERSION"

# Update the image tag in the Kubernetes deployment file for book service
sed -i "s|image: .*/netflixclone:.*|image: $CONTAINER_REGISTRY/netflixclone:$VERSION|g" ./scripts/kubernetes/deployment.yaml

# Apply the Kubernetes configuration
kubectl apply -f ./scripts/kubernetes/deployment.yaml