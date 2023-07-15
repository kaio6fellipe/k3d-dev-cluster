#!/bin/bash

kubectl create namespace nginx
kubectl annotate namespace nginx linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/nginx-example --recursive
kubectl rollout status deployment nginx -n nginx
