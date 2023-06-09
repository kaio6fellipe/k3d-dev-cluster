#!/bin/bash

kubectl delete deployment -n kube-system metrics-server &> /dev/null
sleep 10
kubectl apply -f ./bootstrap/base/metrics-server --recursive &> /dev/null
# kubectl rollout restart deployment metrics-server -n kube-system
kubectl rollout status deployment metrics-server -n kube-system
