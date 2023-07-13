#!/bin/bash

kubectl apply -f ./bootstrap/base/ingress-nginx --recursive
kubectl rollout status deployment ingress-nginx-controller -n ingress-nginx
