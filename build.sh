#!/bin/sh

scriptFolder=$(dirname $(readlink -f $0))

mkdir $1
cd $1

echo "=== Bottle Dowload & Installation  ==="
echo "=> Creation of an virtual environment & connect to it"


~/.local/share/Python-3.10/bin/python3 -m venv venv
. venv/bin/activate 
pip install -U bottle

cp -r ${scriptFolder}/site/* .

mkdir ./static/img
cp $2/* ./static/img/

echo "=> Disconnection of the virtual environment"
deactivate