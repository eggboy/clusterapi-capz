#! /bin/sh

crd_list=`kubectl get customresourcedefinition | grep cluster.x-k8s | awk '{print $1}'`

for f in $crd_list ; do
    echo "$f"
    
    resource_list=`kubectl get $f | awk 'NR!=1' |awk '{print $1}'`

    for r in $resource_list ; do
	echo "$r"
	kubectl patch $f/$r -p '{"metadata":{"finalizers":[]}}' --type=merge
#	kubectl delete $f "$r"
    done

done
