#!/bin/sh

mkdir $1
cd $1

echo "=== Bottle Dowload & Installation  ==="
echo "=> Creation of an virtual environment & connect to it"


~/.local/share/Python-3.10/bin/python3 -m venv venv
. venv/bin/activate 
pip install -U bottle

cp -r $(dirname $0)/site/* $1

echo "=> Disconnection of the virtual environment"
deactivate