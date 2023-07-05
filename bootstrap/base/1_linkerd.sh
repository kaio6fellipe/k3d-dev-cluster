#!/bin/bash

linkerd check --pre || true
linkerd install --crds | kubectl apply -f - || true
linkerd install | kubectl apply -f - || true
linkerd check
linkerd viz install | kubectl apply -f -
linkerd check
linkerd viz dashboard &
