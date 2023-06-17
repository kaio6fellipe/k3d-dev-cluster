#!/bin/bash

kubectl create namespace nginx
kubectl apply -f ./bootstrap/apps/nginx-example --recursive
kubectl rollout status deployment nginx -n nginx
