#!/bin/bash
set -eu

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

function ok { echo -e "${GREEN}OK: $@${NC}"; }
function err { echo -e "\n${RED}ERROR: $@${NC}"; >&2 return 1; }
function info { echo -e "\n${BLUE}$@${NC}"; }

KIND_VERSION="0.8.1"
KUBECTL_VERSION="1.17.0"
JB_VERSION="0.4.0"
HELM_VERSION="3.2.4"

info "This script will configure your ubuntu system to use docker-ce and kind"
read -p "Press enter to continue"...
sudo echo

info '* Configuring Docker CE repositories'
if [[ ! $(sudo apt-key fingerprint 0EBFCD88 2>&1 | grep -o "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88") ]]; then
  sudo apt-get -qy install -o=Dpkg::Use-Pty=0 \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88 2>&1 | grep -o "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88" || err "Incorrect fingerprint!"
  sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable" >/dev/null
else
  ok "Already configured"
fi


info '* Installing docker-ce'
sudo apt-get update >/dev/null
sudo apt-get -qy install -o=Dpkg::Use-Pty=0 \
  docker-ce \
  docker-ce-cli \
  containerd.io

info '* Testing docker installation'
sudo docker run hello-world && ok "Docker works!" || err "Something went wrong"

info '* Configuring current user to use docker'
sudo usermod -aG docker $(whoami)
groups $(whoami) | grep docker || err "Group not added correctly!"

# TODO: nie działa czasami instalacja?
info '* Installing kind ${KIND_VERSION}...'
if [[ ! ($(which kind) && $(kind version | grep ${KIND_VERSION})) ]]; then
  curl -sLo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-$(uname)-amd64
  chmod +x ./kind
  sudo mv ./kind /usr/local/bin/kind

  kind version || err 'kind not configured correctly!'
else
  ok "kind already installed!"
fi

info '* Installing kubectl '${KUBECTL_VERSION}
temp=$(mktemp -d)
cd $temp
curl -sLo kubectl.tar.gz https://dl.k8s.io/v${KUBECTL_VERSION}/kubernetes-client-linux-amd64.tar.gz
tar zxf kubectl.tar.gz
sudo mv kubernetes/client/bin/kubectl /usr/local/bin/kubectl
kubectl version | grep "${KUBECTL_VERSION}" && ok "kubectl works!" || err "kubectl error"
cd - >/dev/null
rm -rf $temp

info '* Installing jsonnet-bundler '${JB_VERSION}
wget https://github.com/jsonnet-bundler/jsonnet-bundler/releases/download/v${JB_VERSION}/jb-linux-amd64
chmod a+x jb-linux-amd64
sudo mv jb-linux-amd64 /usr/local/bin/jb


info '* Installing helm '${HELM_VERSION}
temp=$(mktemp -d)
cd $temp
wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz
tar zxf helm-v${HELM_VERSION}-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
cd - >/dev/null
rm -rf $temp
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
ok 'Helm installed!'

# TODO: Install qbec
# https://github.com/splunk/qbec
info '* Installing qbec'
temp=$(mktemp -d)
cd $temp
wget https://github.com/splunk/qbec/releases/download/v0.12.1/qbec-linux-amd64.tar.gz
tar zxf qbec-linux-amd64.tar.gz
sudo mv qbec /usr/local/bin
cd - >/dev/null
rm -rf $temp
ok 'Qbec installed!'


info '* Installing Jsonnet'
temp=$(mktemp -d)
cd $temp
wget https://github.com/google/jsonnet/releases/download/v0.16.0/jsonnet-bin-v0.16.0-linux.tar.gz
tar zxf jsonnet-bin-v0.16.0-linux.tar.gz
sudo mv jsonnet jsonnetfmt /usr/local/bin
cd - >/dev/null
rm -rf $temp
ok 'Jsonnet installed!'

info '!!!! Please re-login to your account to reload group privileges.'
