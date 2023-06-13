#!/bin/bash

helm repo add kiali https://kiali.org/helm-charts
helm upgrade --install kiali-server kiali/kiali-server -n istio-system --set auth.strategy="anonymous" --wait
kubectl rollout status deployment kiali -n istio-system

for file in bootstrap/base/helm/kiali/*.sh; do
    bash "$file"
done
