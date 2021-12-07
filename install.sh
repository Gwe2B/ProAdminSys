#!/bin/sh

echo "Start of the install process..."
echo "A temporary folder will be created, please don't touch it before the process
has terminated!\n"

#OpenSSL is required, if is not installed pip will not function correctly
opensslDlUrl="https://www.openssl.org/source/openssl-1.1.1g.tar.gz"
pythonDlUrl="https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz"
dlFolder="tmpFolder/"

mkdir ${dlFolder}
cd "${dlFolder}/"

echo "-> OpenSSL Download & Installation"
wget $opensslDlUrl -O openssl.tar.gz
tar -xzf openssl.tar.gz
cd openssl-1.1.1g
./config --prefix="${HOME}/openssl" --openssldir="${HOME}/openssl" no-ssl2
make
make install
cd ..

echo "-> Python Download & Installation"
wget $pythonDlUrl -O python310.tgz
tar -xzf python310.tgz
cd "Python-3.10.0"
./configure --prefix="${HOME}/.local/share/Python-3.10" --enable-optimizations --with-openssl="${HOME}/openssl/"
make install -j3

echo "-> Cleaning"
cd ../..
rm -rf ${dlFolder}