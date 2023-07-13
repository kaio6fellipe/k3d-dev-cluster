#!/bin/bash

kubectl create namespace whoami
kubectl annotate namespace whoami linkerd.io/inject=enabled
kubectl apply -f ./bootstrap/apps/whoami --recursive
