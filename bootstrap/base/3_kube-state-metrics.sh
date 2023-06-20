#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install ksm prometheus-community/kube-state-metrics -n grafana-agent --set image.tag="v2.8.2"
