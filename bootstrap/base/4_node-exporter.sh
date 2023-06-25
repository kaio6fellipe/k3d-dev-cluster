#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update prometheus-community
helm upgrade --install nodeexporter prometheus-community/prometheus-node-exporter -n grafana-agent
