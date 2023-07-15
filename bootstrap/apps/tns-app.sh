#!/bin/bash

kubectl create namespace tns-cloud
kubectl annotate namespace tns-cloud linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/tns-app --recursive
kubectl rollout status deployment app -n tns-cloud
kubectl rollout status deployment db -n tns-cloud
kubectl rollout status deployment loadgen -n tns-cloud
