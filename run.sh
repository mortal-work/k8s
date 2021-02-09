#!/usr/bin/env bash
kubectl create ns s7
kubectl config set-context $(kubectl config current-context) --namespace s7
kubectl apply -f configmap.yaml
kubectl apply -f svc.yaml
kubectl apply -f sts.yaml
echo waiting for 60 sec, statefulset is starting
sleep 60
kubectl exec -it redis-0 -- redis-cli info replication
