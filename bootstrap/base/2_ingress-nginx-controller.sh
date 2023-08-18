#!/bin/bash

kubectl create ns ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update ingress-nginx
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --version 4.6.1 -n ingress-nginx --values ./bootstrap/base/ingress-nginx/ingress-nginx-values.yaml
kubectl rollout status deployment ingress-nginx-controller -n ingress-nginx
