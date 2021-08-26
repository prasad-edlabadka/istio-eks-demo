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
echo "┃${BACK_COLOR}                Demo Scenario 4 - Traffic Shifting                  ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ This scenario demonstrates how you can shift traffic slowly from   ┃"
echo "┃ one version to another version. We will start with;                ┃"
echo "┃       ${PINK}10%${CLOSE} traffic to V2 and ${GREEN}90%${CLOSE} to V1 then;                        ┃"
echo "┃       ${PINK}50%${CLOSE} traffic to V2 and ${GREEN}50%${CLOSE} to V1 then;                        ┃"
echo "┃       ${PINK}90%${CLOSE} traffic to V2 and ${GREEN}10%${CLOSE} to V1                              ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}                 ${GREEN}┏━━━━━━━━━━━━━━┓${CLOSE}                 ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━━━━━━━━━━━>>${GREEN}┃  Reviews v1  ┃${CLOSE}                 ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}                 ${GREEN}┗━━━━━━━━━━━━━━┛${CLOSE}                 ┃"
echo "┃          ${CYAN}┃                        ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}                 ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}                 ┃"
echo "┃                                   ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}                 ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo4/virtual-service-reviews-90-10.yaml
echo "${CLOSE}"
echo "Now Routing ${PINK}10%${CLOSE} traffic to V2 and ${GREEN}90%${CLOSE} to V1..."
read -n 1
echo "${DEBUG_COLOR}Shifting traffic..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo4/virtual-service-reviews-80-20.yaml
echo "${CLOSE}"
echo "Now Routing ${PINK}50%${CLOSE} traffic to V2 and ${GREEN}50%${CLOSE} to V1..."
read -n 1
echo "${DEBUG_COLOR}Shifting traffic..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo4/virtual-service-reviews-50-v3.yaml
echo "${CLOSE}" 
echo "Routing ${PINK}90%${CLOSE} traffic to V2 and ${GREEN}10%${CLOSE} to V1..."
echo
echo "Demo is complete."
echo