#!/bin/bash

linkerd check --pre || true
kubectl apply -f ./bootstrap/base/linkerd/crds --recursive
kubectl create namespace linkerd || true
kubectl apply -f ./bootstrap/base/linkerd/deployment --recursive
linkerd check
kubectl create namespace linkerd-viz || true
kubectl apply -f ./bootstrap/base/linkerd/viz --recursive
kubectl rollout status deployment web -n linkerd-viz
kubectl rollout status deployment metrics-api -n linkerd-viz
kubectl rollout status deployment tap -n linkerd-viz
kubectl rollout status deployment tap-injector -n linkerd-viz
kubectl rollout status deployment prometheus -n linkerd-viz
linkerd viz check
linkerd viz dashboard &
