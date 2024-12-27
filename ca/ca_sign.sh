#!/bin/bash

PPFILE="pp.sec"

openssl ca \
    -in ../server/server.csr \
    -out ../server/server.crt \
    -cert myCA.crt \
    -keyfile private/myCA.key \
    -passin file:$PPFILE \
    -config openssl.cnf \
    -batch
# sign the certificate signing request with the private key of the CA

openssl pkcs12 -export -out envlop.pfx -in server.crt -inkey server.key -name " server cert and key" 
# generate a pfx file that contains the server certificate and the private key. pfk file is used to import the certificate and the private key into the server
# pfx stands for Personal Information Exchange

./ca_verif.sh