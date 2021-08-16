#!/bin/bash
set=+x
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform
sudo mv terraform /usr/local/bin
rm -fv terraform_0.12.26_linux_amd64.zip
cd ..
