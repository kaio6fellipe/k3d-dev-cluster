#!/bin/bash

kubectl create namespace traefik-mesh
helm repo add traefik https://traefik.github.io/charts
helm repo update traefik
helm upgrade --install traefik-mesh traefik/traefik-mesh --set kubedns=true --set logLevel=info --set controller.logLevel=info --set proxy.logLevel=info --set tracing.deploy=false --set tracing.jaeger.enabled=false --set metrics.deploy=false --set metrics.prometheus.enabled=true -n traefik-mesh
