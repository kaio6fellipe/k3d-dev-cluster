#!/bin/bash

kubectl create namespace emojivoto
kubectl annotate namespace emojivoto linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/emojivoto --recursive
kubectl rollout status deployment web -n emojivoto
kubectl rollout status deployment emoji -n emojivoto
kubectl rollout status deployment voting -n emojivoto