INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_DOMAIN=${INGRESS_HOST}.nip.io

cat <<EOF | kubectl apply -f -
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: nginx-example-host
  namespace: nginx
spec:
  hosts:
  - "nginx-example.${INGRESS_DOMAIN}"
  gateways:
  - nginx-gateway.nginx.svc.cluster.local
  http:
  - route:
    - destination:
        host: nginx
        port:
          number: 80
---
EOF