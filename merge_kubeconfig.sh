#!/bin/bash

clusterctl get kubeconfig $1 > config
export KUBECONFIG=~/.kube/config:./config
kubectl config view --flatten > kubeconfig.yaml
mv kubeconfig.yaml ~/.kube/config
