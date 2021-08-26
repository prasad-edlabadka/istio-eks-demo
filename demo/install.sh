## Configure following variables
export ISTIO_ROOT=/Users/prasadedlabadkar/istio-1.10.3
export NAMESPACE=bookinfo
## Don't edit anything below
echo
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo ┃ Setup Istio on AWS. Please have AWS CLI configured for your account.┃
echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
echo
echo Creating EKS Cluster...
eksctl create cluster --name=istio-eks --region=ap-south-1 --zones=ap-south-1a,ap-south-1b --fargate --node-zones=ap-south-1a  --nodes=1 --nodes-min=1 --nodes-max=2
echo EKS Cluster Created.
echo
echo Installing Istio...
${ISTIO_ROOT}/bin/istioctl install -y
echo Installing addons...
kubectl apply -f ./scripts/install/kiali.yaml
kubectl apply -f ./scripts/install/prometheus.yaml
kubectl apply -f ./scripts/install/grafana.yaml
kubectl apply -f ./scripts/install/jaeger.yaml
echo Istio installed.
echo
echo Installing BookInfo Application...
kubectl create namespace ${NAMESPACE}
kubectl label namespace ${NAMESPACE} istio-injection=enabled
kubectl apply -n ${NAMESPACE} -f ./scripts/install/bookinfo.yaml
kubectl apply -n ${NAMESPACE} -f ./scripts/install/bookinfo-gateway.yaml
echo Waiting for 30 seconds for applications to start...
sleep 30
${ISTIO_ROOT}/bin/istioctl d kiali&
${ISTIO_ROOT}/bin/istioctl d grafana&
${ISTIO_ROOT}/bin/istioctl d jaeger&
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo BookInfo Application installed.
echo
echo Book info application is available at http://${INGRESS_HOST}/productpage
echo
echo
# kubectl delete -n bookinfo -f /Users/prasadedlabadkar/istio-1.10.3/samples/bookinfo/platform/kube/bookinfo.yaml