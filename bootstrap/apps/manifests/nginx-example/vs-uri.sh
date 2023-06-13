INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_DOMAIN=${INGRESS_HOST}.nip.io

cat <<EOF | kubectl apply -f -
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: nginx-example-uri
  namespace: nginx
spec:
  hosts:
  - "${INGRESS_DOMAIN}"
  gateways:
  - nginx-gateway.nginx.svc.cluster.local
  http:
    - match:
        - uri:
            prefix: /nginx-example
      rewrite:
        uri: "/"
      route:
        - destination:
            host: nginx
            port:
              number: 80
---
EOF