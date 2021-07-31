#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=mirch/prediction_service

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction-service --image=docker.io/${dockerpath} --port=8000

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 5:
# Save pod name and view logs
output="$(kubectl get pods -o=name)"
kubectl logs $output

echo "==========================="

# Step 4:
# Forward the container port to a host
kubectl port-forward deployments/prediction-service 8000:80

