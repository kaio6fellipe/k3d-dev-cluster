#!/bin/bash

kubectl create namespace tns-cloud
kubectl apply -f ./bootstrap/apps/tns-app --recursive
