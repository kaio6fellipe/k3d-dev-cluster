#!/bin/bash

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
kubectl create namespace istio-system
helm upgrade --install istio-base istio/base -n istio-system --wait
helm upgrade --install istiod istio/istiod -n istio-system --wait
kubectl label namespace istio-system istio-injection=enabled
helm upgrade --install istio-ingressgateway istio/gateway -n istio-system --wait
