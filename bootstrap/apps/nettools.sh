#!/bin/bash

kubectl create namespace nettools
kubectl annotate namespace nettools linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/nettools --recursive
