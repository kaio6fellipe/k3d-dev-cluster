#!/bin/bash

linkerd check --pre || true
kubectl apply -f ./bootstrap/base/linkerd/crds --recursive
kubectl apply -f ./bootstrap/base/linkerd/deployment --recursive
linkerd check
kubectl apply -f ./bootstrap/base/linkerd/viz --recursive
kubectl rollout status deployment web -n linkerd-viz
linkerd check
linkerd viz dashboard &
