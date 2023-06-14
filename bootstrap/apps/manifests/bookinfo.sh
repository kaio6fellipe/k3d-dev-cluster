#!/bin/bash

kubectl apply -f ./bootstrap/apps/manifests/bookinfo --recursive

for file in bootstrap/apps/manifests/bookinfo/*.sh; do
    bash "$file"
done