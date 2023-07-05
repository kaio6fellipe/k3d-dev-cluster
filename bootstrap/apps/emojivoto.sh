#!/bin/bash

kubectl create namespace emojivoto
kubectl annotate namespace emojivoto linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/emojivoto --recursive
