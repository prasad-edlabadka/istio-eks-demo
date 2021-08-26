## Configure following variables
export ISTIO_ROOT=/Users/prasadedlabadkar/istio-1.10.3
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
## Don't edit anything below
echo
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃ Cleanup Istio on AWS. Please have AWS CLI configured for your account.  ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo
echo "${DIM_YELLOW}Press any key to begin cleanup..${CLOSE}"
read -n 1
echo "Deleting Bookinfo Application...${DEBUG_COLOR}"
./scripts/install/cleanup.sh
echo "${CLOSE}"
echo "Bookinfo Application deleted."
echo
echo "Removing Istio...${DEBUG_COLOR}"
${ISTIO_ROOT}/bin/istioctl x uninstall --purge -y
echo "${CLOSE}Istio removed."
echo
echo "Deleting EKS Cluster...${DEBUG_COLOR}"
eksctl delete cluster --name istio-eks
echo "${CLOSE}EKS Cluster deleted. Cleanup complete."
echo