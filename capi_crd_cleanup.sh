#! /bin/sh

crd_list=`kubectl get customresourcedefinition | grep x-k8s | awk '{print $1}'`

for f in $crd_list ; do
    echo "$f"

    kubectl patch crd/$f -p '{"metadata":{"finalizers":[]}}' --type=merge
    kubectl delete customresourcedefinition "$f"
done
