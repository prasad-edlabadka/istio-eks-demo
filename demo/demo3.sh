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
echo "┃${BACK_COLOR}            Demo Scenario 3 - Canary Release - Part 1               ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ Routing based on browser. This is useful to route the request to   ┃"
echo "┃ specific version based on which browser is using the app. In this  ┃"
echo "┃ demo we check browser type and route the call to V2 if call is     ┃"
echo "┃ from 'Safari' and for all other browser route to V1.               ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}  ${DEBUG_COLOR}browser${CLOSE} = any    ${GREEN}┏━━━━━━━━━━━━━━┓${CLOSE}               ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━━━━━━━━━━━━━>>${GREEN}┃  Reviews v1  ┃${CLOSE}               ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}                   ${GREEN}┗━━━━━━━━━━━━━━┛${CLOSE}               ┃"
echo "┃          ${CYAN}┃       ${DEBUG_COLOR}browser${CLOSE} = safari   ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}               ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}               ┃"
echo "┃                                     ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}               ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo3/virtual-service-reviews-demo3-part1.yaml
echo "${CLOSE}"
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo
echo "${DIM_YELLOW}Press any key to setup next scenario...${CLOSE}"
read -n 1
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃${BACK_COLOR}            Demo Scenario 3 - Canary Release - Part 2               ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ Once V2 is full tested, all browsers except 'Safari' will be       ┃"
echo "┃ routed to V2 and 'Safari' will be routed to new version V3.        ┃"
echo "┃ This scenario demonstrates how a new feature can be rolled out to  ┃"
echo "┃ specific user set and then roll out to all the users.              ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}  ${DEBUG_COLOR}browser${CLOSE} = any    ${PINK}┏━━━━━━━━━━━━━━┓${CLOSE}               ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━━━━━━━━━━━━━>>${PINK}┃  Reviews v2  ┃${CLOSE}               ┃"
echo "┃  ${YELLOW}┗━━━━━━━┳━━━━━━┛${CLOSE}                   ${PINK}┗━━━━━━━━━━━━━━┛${CLOSE}               ┃"
echo "┃          ${CYAN}┃       ${DEBUG_COLOR}browser${CLOSE} = safari   ${RED}┏━━━━━━━━━━━━━━┓${CLOSE}               ┃"
echo "┃          ${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━━━>>${RED}┃  Reviews v3  ┃${CLOSE}               ┃"
echo "┃                                     ${RED}┗━━━━━━━━━━━━━━┛${CLOSE}               ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo3/virtual-service-reviews-demo3-part2.yaml
echo "${CLOSE}"
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo
echo "${DIM_YELLOW}Press any key to setup next scenario...${CLOSE}"
read -n 1
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃${BACK_COLOR}            Demo Scenario 3 - Canary Release - Part 3               ${CLOSE}┃"
echo "┃${BACK_COLOR}                                                                    ${CLOSE}┃"
echo "┃                                                                    ┃"
echo "┃ Once feature is fully tested with 'Safari', move everyone to V3 by ┃"
echo "┃ default                                                            ┃"
echo "┃                                                                    ┃"
echo "┃  ${YELLOW}┏━━━━━━━━━━━━━━┓${CLOSE}  ${DEBUG_COLOR}browser${CLOSE} = all    ${RED}┏━━━━━━━━━━━━━━┓${CLOSE}               ┃"
echo "┃  ${YELLOW}┃ Product Page ┣${CYAN}━━━━━━━━━━━━━━━━━>>${RED}┃  Reviews v3  ┃${CLOSE}               ┃"
echo "┃  ${YELLOW}┗━━━━━━━━━━━━━━┛${CLOSE}                   ${RED}┗━━━━━━━━━━━━━━┛${CLOSE}               ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to setup this scenario...${CLOSE}"
read -n 1
echo "${DEBUG_COLOR}Setting up scenario..."
kubectl apply -n ${NAMESPACE} -f ./scripts/demo3/virtual-service-reviews-demo3-part3.yaml
echo "${CLOSE}"
echo "Demo is ready. Please send some traffic and observe in Kiali..."
echo