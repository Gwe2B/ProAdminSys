#!/bin/sh

pythonDlUrl="https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz"
#OpenSSL is required, if is not installed pip will not function correctly
opensslDlUrl="https://www.openssl.org/source/openssl-1.1.1g.tar.gz"

outputFolder="../output/"
helpMsg="$(basename "$0") [OPTIONS] <CMD> <ressources folder>
Programme to create a website from images in the 'ressources folder'

where CMD is one of:
	build	Build the website
	install	Install the environment

where OPTIONS can be:
	-h	Show this help message\n"

while getopts ':h:' option; do
	case $option in
		h)
			echo "$helpMsg"
			exit
			;;
		/?)
			echo "Unknown option -$option \n" >&2
			echo "$helpMsg" >&2
			exit 1
			;;
	esac
done
shift $((OPTIND-1))

if [ $1 = "install" ]
then
	mkdir $outputFolder "${outputFolder}/downloads"
	cd "${outputFolder}/downloads"

	echo "=== OpenSSL Download & Installation ==="
	wget $opensslDlUrl -O openssl.tar.gz
	tar -xzf openssl.tar.gz
	cd openssl-1.1.1g
	./config --prefix="$HOME/openssl" --openssldir="$HOME/openssl" no-ssl2
	make
	make install
	cd ..

	echo "=== Python Download & Installation ==="
	wget $pythonDlUrl -O python310.tgz
	tar -xzf python310.tgz
	cd "Python-3.10.0"
	./configure --prefix="$HOME/.local/share/Python-3.10" --enable-optimizations --with-openssl="$HOME/openssl/"
	make install -j3

	echo "=== Cleaning ==="
	cd ../..
	rm -r downloads

	echo "=== Bottle Dowload & Installation  ==="
	echo "=> Creation of an virtual environment & connect to it"
	~/.local/share/Python-3.10/bin/python3 -m venv .
	. bin/activate
	pip install -U bottle
	echo "=> Disconnection of the virtual environment"
	deactivate
fi
