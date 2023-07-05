#!/bin/bash

kubectl create namespace whoami
kubectl apply -f ./bootstrap/apps/whoami --recursive
