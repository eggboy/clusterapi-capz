#! /bin/sh

crd_list=`kubectl get customresourcedefinition | grep cluster.x-k8s | awk '{print $1}'`

for f in $crd_list ; do
    echo "$f"

    kubectl get $f
done
