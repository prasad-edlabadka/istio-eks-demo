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
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃${BACK_COLOR}                Demo Scenario 5 - Traffic Mirroring                 ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ This scenario demonstrates how you can mirror the traffic from a   ┃"
echo "┃ live service to another service allowing you to understand service ┃"
echo "┃ behaviour without causing any impact.                              ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}                 ${GREEN}┏━━━━━━━━━━━━━━┓${CLOSE}                 ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━━━━━━━━━━━>>${GREEN}┃  Reviews v1  ┃${CLOSE}                 ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}                 ${GREEN}┗━━━━━━━━━━━━━━┛${CLOSE}                 ┃"
echo "┃          ${CYAN}┃        mirror          ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}                 ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}                 ┃"
echo "┃                                   ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}                 ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo5/virtual-service-reviews-mirror.yaml
echo "${CLOSE}"
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo