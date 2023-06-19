#!/bin/bash

helm repo add prometheus https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install nodeexporter prometheus/prometheus-node-exporter -n grafana-agent
