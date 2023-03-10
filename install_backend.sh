#!/bin/bash

original_path=$(pwd)

cd "$original_path"/components/common
chmod 777 install.sh

cd "$original_path"/components/backend
chmod 777 install.sh
chmod 777 initialize.sh
chmod 777 start.sh

apt install python3.8-venv
apt install sqlite3

path_install=~/GreenInHouse

mkdir -p "$path_install"
cp -a "$original_path"/. "$path_install"
cd "$path_install"
mkdir -p venv_backend
cd "$path_install"/venv_backend
python3 -m venv .venv
source "$path_install"/venv_backend/.venv/bin/activate

pip3 install wheel flask connexion sqlalchemy==2.0.0b3 pyyaml
pip3 install connexion[swagger-ui]

cd "$path_install"/components/common
./install.sh

cd "$path_install"/components/backend
./install.sh
./initialize.sh
./start.sh