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
echo "┃${BACK_COLOR}            Demo Scenario 1 - Fallack Routing - Step 1               ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                     ${CLOSE}┃"
echo "┃                                                                     ┃"
echo "┃ Standard routing where all the calls from front end are routed to   ┃"
echo "┃ default version of API i.e. Reviews ${GREEN}V1${CLOSE}                              ┃"
echo "┃                                                                     ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}       ${GREEN}┏━━━━━━━━━━━━━━┓${CLOSE}                            ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━>>${GREEN}┃  Reviews v1  ┃${CLOSE}                            ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}       ${GREEN}┗━━━━━━━━━━━━━━┛${CLOSE}                            ┃"
echo "┃          ${CYAN}┃              ${RED}┏━━━━━━━━━━━━━━┓${CLOSE}                            ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━>>${RED}┃    Details   ┃${CLOSE}                            ┃"
echo "┃                         ${RED}┗━━━━━━━━━━━━━━┛${CLOSE}                            ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo1/destination-rule-all.yaml -f ./scripts/demo1/virtual-service-reviews-v1.yaml
echo "${CLOSE}" 
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo
echo "${DIM_YELLOW}Press any key to setup next scenario...${CLOSE}"
read -n 1
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                       ${CLOSE}┃"
echo "┃${BACK_COLOR}            Demo Scenario 1 - Fallack Routing - Step 2                 ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                       ${CLOSE}┃"
echo "┃                                                                       ┃"
echo "┃ When ${GREEN}V1${CLOSE} is unavailable, change the traffic routing to route all the   ┃"
echo "┃ traffic to ${PINK}V2${CLOSE} of the service that may have a different implementation ┃"
echo "┃                                                                       ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}       ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}                              ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}                              ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}       ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}                              ┃"
echo "┃          ${CYAN}┃              ${RED}┏━━━━━━━━━━━━━━┓${CLOSE}                              ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━>>${RED}┃    Details   ┃${CLOSE}                              ┃"
echo "┃                         ${RED}┗━━━━━━━━━━━━━━┛${CLOSE}                              ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo1/virtual-service-reviews-v2.yaml
echo "${CLOSE}" 
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo