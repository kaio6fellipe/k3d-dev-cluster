#!/bin/bash

kubectl delete deployment -n kube-system metrics-server &> /dev/null
kubectl apply -f ./bootstrap/base/manifests/metrics-server --recursive &> /dev/null
# kubectl rollout restart deployment metrics-server -n kube-system
kubectl rollout status deployment metrics-server -n kube-system
