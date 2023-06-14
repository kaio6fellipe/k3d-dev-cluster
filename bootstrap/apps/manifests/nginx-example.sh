#!/bin/bash

kubectl create namespace nginx
kubectl label namespace nginx istio-injection=enabled --overwrite
kubectl apply -f ./bootstrap/apps/manifests/nginx-example --recursive
# kubectl rollout status deployment nginx -n nginx

for file in bootstrap/apps/manifests/nginx-example/*.sh; do
    bash "$file"
done
