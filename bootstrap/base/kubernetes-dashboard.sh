#!/bin/bash

# Kubernetes dashboard
kubectl create namespace kubernetes-dashboard || true
# kubectl annotate namespace kubernetes-dashboard linkerd.io/inject=enabled || true
kubectl apply -f ./bootstrap/base/kubernetes-dashboard --recursive
kubectl create serviceaccount -n kubernetes-dashboard admin-user || true
kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user || true
kubectl rollout status deployment kubernetes-dashboard-api -n kubernetes-dashboard
kubectl rollout status deployment kubernetes-dashboard-web -n kubernetes-dashboard
kubectl rollout status deployment kubernetes-dashboard-metrics-scraper -n kubernetes-dashboard
