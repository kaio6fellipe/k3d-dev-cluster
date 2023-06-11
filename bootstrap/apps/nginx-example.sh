#!/bin/bash

kubectl create namespace nginx
kubectl label namespace nginx istio-injection=enabled --overwrite
kubectl apply -f ./bootstrap/apps/nginx-example --recursive
