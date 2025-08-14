#!/bin/sh
cd ~
sudo apt install git aria2 -y
git clone https://gitlab.com/OrangeFox/misc/scripts
cd scripts
sudo bash setup/android_build_env.sh
sudo bash setup/install_android_sdk.sh

# Fake identify
git config --global user.name "teto123"
git config --global user.email "teto@teto.teto"

mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git # (or, using ssh, "git clone git@gitlab.com:OrangeFox/sync.git")
cd ~/OrangeFox_sync/sync/
yes | ./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1

cd ~/fox_12.1
