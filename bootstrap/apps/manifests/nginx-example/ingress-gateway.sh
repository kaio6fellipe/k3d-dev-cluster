INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_DOMAIN=${INGRESS_HOST}.nip.io

cat <<EOF | kubectl apply -f -
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: nginx-gateway
  namespace: nginx
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "nginx-example.${INGRESS_DOMAIN}"
    - "${INGRESS_DOMAIN}"
---
EOF