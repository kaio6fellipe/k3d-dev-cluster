#!/bin/bash

helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo update sealed-secrets
helm upgrade --install sealed-secrets sealed-secrets/sealed-secrets -n kube-system
kubectl rollout status deployment sealed-secrets -n kube-system
kubectl delete secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key=active
kubectl apply -f bootstrap/base/0_sealed-secrets.key || exit 1
kubectl delete pod -n kube-system -l app.kubernetes.io/name=sealed-secrets
