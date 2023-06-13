#!/bin/bash

# Istio
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
kubectl create namespace istio-system
helm upgrade --install istio-base istio/base -n istio-system --wait
helm upgrade --install istiod istio/istiod -n istio-system --wait
kubectl label namespace istio-system istio-injection=enabled
helm upgrade --install istio-ingressgateway istio/gateway -n istio-system --wait

# Kubernetes dashboard
GITHUB_URL=https://github.com/kubernetes/dashboard/releases
VERSION_KUBE_DASHBOARD=$(curl -w '%{url_effective}' -I -L -s -S ${GITHUB_URL}/latest -o /dev/null | sed -e 's|.*/||')
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${VERSION_KUBE_DASHBOARD}/aio/deploy/recommended.yaml
kubectl create serviceaccount -n kubernetes-dashboard admin-user
kubectl create clusterrolebinding -n kubernetes-dashboard admin-user --clusterrole cluster-admin --serviceaccount=kubernetes-dashboard:admin-user

# Istio addons
kubectl apply -f ./bootstrap/base/helm/istio --recursive
kubectl rollout status deployment/kiali -n istio-system