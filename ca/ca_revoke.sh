#!/bin/bash

openssl ca -revoke ../server/server.crt -keyfile private/myCA.key -cert myCA.crt -passin file:pp.sec -config openssl.cnf
# revoke a certificate

openssl ca -gencrl -out crl/myCA.crl -keyfile private/myCA.key -cert myCA.crt -passin file:pp.sec -config openssl.cnf
# generate a new crl file after revoking a certificate