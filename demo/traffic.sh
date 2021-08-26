# export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
while [ 1 -le 2 ]
do
  curl http://${INGRESS_HOST}/productpage -i -s | grep HTTP
done