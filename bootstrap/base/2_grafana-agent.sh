#!/bin/bash

kubectl create namespace grafana-agent
# kubectl annotate namespace grafana-agent linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/base/grafana-agent --recursive
kubectl delete pods --all -n grafana-agent --force
kubectl rollout status statefulset grafana-agent -n grafana-agent
kubectl rollout status deployment grafana-agent-traces -n grafana-agent
kubectl rollout status daemonset grafana-agent-logs -n grafana-agent

