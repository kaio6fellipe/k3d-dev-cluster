#!/bin/bash

kubectl apply -f ./bootstrap/base/opencost --recursive
kubectl delete pod -n grafana-agent -l app.kubernetes.io/name=opencost
kubectl rollout status deployment opencost -n grafana-agent
