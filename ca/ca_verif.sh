#!/bin/bash

openssl verify -CAfile myCA.crt ../server/server.crt
# verify the certificate

openssl verify -crl_check -CAfile myCA.crt -CRLfile crl/myCA.crl ../server/server.crt
# check if the certificate is revoked

openssl s_client -connect ymahni.42.fr:443 -CAfile myCA.crt
# connect to the server and verify the certificate