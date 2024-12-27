#!/bin/bash

PP="1pass3phrase3ysf7"
SUBJ="/C=MA/ST=Khouribga/L=Khouribga/O=1337CodingSchool/CN=ymahni.42.fr"

# generate a passphrase file to encrypt the private key
echo $PP > pp.sec

# copy my custom openssl.cnf file to the current directory
cp ../openssl.cnf openssl.cnf

# create a directory to store the certificates
mkdir newcerts

# create a directory to store the private key
mkdir private

# create a file index that will keep track of the certificates
touch index

# create a file with the number 1000 in it to keep track of the serial number
echo 1000 > serial

# create a file with the number 01 in it to keep track of the crl number
echo 01 > crlnumber


# generate a private key with the RSA algorithm and encrypt it with the aes256 algorithm
openssl genpkey -algorithm RSA -out private/myCA.key -aes256 -pass file:pp.sec

# generate a self-signed certificate with the private key
openssl req -key private/myCA.key -new -x509 -out myCA.crt -days 3650 -subj $SUBJ -passin file:pp.sec

# generate a crl file which will contain the revoked certificates
mkdir crl
openssl ca -gencrl -out crl/myCA.crl -keyfile private/myCA.key -cert myCA.crt -passin file:pp.sec -config openssl.cnf