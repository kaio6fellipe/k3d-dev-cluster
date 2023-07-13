#!/bin/bash

kubectl create namespace tns-cloud
kubectl annotate namespace tns-cloud linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/tns-app --recursive
