#!/bin/bash

helm repo add prometheus https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install ksm prometheus/kube-state-metrics -n grafana-agent
