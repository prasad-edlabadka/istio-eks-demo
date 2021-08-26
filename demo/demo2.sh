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
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃${BACK_COLOR}               Demo Scenario 2 - Traffic Splitting                  ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ Routing to all versions of reviews app with equal weight.          ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}  33%  ${GREEN}┏━━━━━━━━━━━━━━┓${CLOSE}                           ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━>>${GREEN}┃  Reviews v1  ┃${CLOSE}                           ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}       ${GREEN}┗━━━━━━━━━━━━━━┛${CLOSE}                           ┃"
echo "┃          ${CYAN}┃${CLOSE}         33%  ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}                           ┃"
echo "┃          ${CYAN}┣━━━━━━━━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}                           ┃"
echo "┃          ${CYAN}┃              ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}                           ┃"
echo "┃          ${CYAN}┃${CLOSE}         33%  ${RED}┏━━━━━━━━━━━━━━┓${CLOSE}                           ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━>>${RED}┃  Reviews v3  ┃${CLOSE}                           ┃"
echo "┃                         ${RED}┗━━━━━━━━━━━━━━┛${CLOSE}                           ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "Press any key to setup this scenario..."
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo2/destination-rule-all.yaml
kubectl delete -n ${NAMESPACE} -f ./scripts/demo2/virtual-service-reviews.yaml
echo "${CLOSE}"
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo