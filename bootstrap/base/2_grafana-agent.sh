#!/bin/bash

kubectl create namespace grafana-agent
kubectl apply -f ./bootstrap/base/grafana-agent --recursive
kubectl delete pods --all -n grafana-agent --force
