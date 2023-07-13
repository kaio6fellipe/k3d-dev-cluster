#!/bin/bash

kubectl create namespace grafana-agent
kubectl annotate namespace grafana-agent linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/base/grafana-agent --recursive
kubectl delete pods --all -n grafana-agent --force
