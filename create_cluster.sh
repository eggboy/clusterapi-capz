#!/bin/bash

# Name of the Azure datacenter location.
export AZURE_LOCATION="eastus"

# Select VM types.
export AZURE_CONTROL_PLANE_MACHINE_TYPE="Standard_D4_v3"
export AZURE_NODE_MACHINE_TYPE="Standard_D4_v3"

export AZURE_CLUSTER_IDENTITY_SECRET_NAME="cluster-identity-secret"
export CLUSTER_IDENTITY_NAME=${CLUSTER_IDENTITY_NAME:="cluster-identity"} 
export AZURE_CLUSTER_IDENTITY_SECRET_NAMESPACE="default"

clusterctl generate cluster k8s1273 \
  --kubernetes-version v1.27.3 \
  --control-plane-machine-count=1 \
  --worker-machine-count=2 \
  --target-namespace=default \
  > k8s1273.yaml
