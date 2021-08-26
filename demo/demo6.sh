## Configure following variables
export ISTIO_ROOT=/Users/prasadedlabadkar/Desktop/istio
export NAMESPACE=bookinfo
export BACK_COLOR="\033[7;37m"
export CLOSE="\033[1;00m"
export DEBUG_COLOR="\033[2;37m"
export YELLOW="\033[1;33m"
export GREEN="\033[1;32m"
export PINK="\033[1;35m"
export CYAN="\033[1;36m"
export RED="\033[1;34m"
export DIM_YELLOW="\033[2;33m"
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                     ${CLOSE}┃"
echo "┃${BACK_COLOR}               Demo Scenario 6 - Multi API Container                 ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                     ${CLOSE}┃"
echo "┃                                                                     ┃"
echo "┃ This scenario demonstrates how you can deploy multiple APIs in a    ┃"
echo "┃ single container and have multiple endpoints available.             ┃"
echo "┃                                                                     ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${CLOSE}                       ┃"
echo "┃  ${YELLOW}┃ ${GREEN}┏━━━━━━━━━━━━━━┓    ${RED}┏━━━━━━━━━━━━━━━━━━┓${YELLOW} ┃${CLOSE}                       ┃"
echo "┃  ${YELLOW}┃ ${GREEN}┃   Pet Store  ┃    ${RED}┃  Account Balance ┃${YELLOW} ┃${CLOSE}                       ┃"
echo "┃  ${YELLOW}┃ ${GREEN}┗━━━━━━━━━━━━━━┛    ${RED}┗━━━━━━━━━━━━━━━━━━┛${YELLOW} ┃${CLOSE}                       ┃"
echo "┃  ${YELLOW}┃ Docker container                         ┃${CLOSE}                       ┃"
echo "┃  ${YELLOW}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${CLOSE}                       ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo6/multi-api.yaml
kubectl apply -n ${NAMESPACE} -f ./scripts/demo6/multi-api-gateway.yaml
echo "${CLOSE}" 
echo "Demo is ready. Press any key send some traffic..."
read -n 1
echo "${DEBUG_COLOR}Generating Traffic..."
echo
for ((i=0; i<=10; i++)); do
    curl http://${INGRESS_HOST}/v2/account/balance -i -s | grep HTTP&
done
for ((i=0; i<=10; i++)); do
    curl http://${INGRESS_HOST}/v2/store/inventory -i -s | grep HTTP&
done
echo "Done."