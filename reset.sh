#!/bin/bash

rm -rf ca/crl ca/newcerts ca/private ca/index* ca/serial* ca/crlnumber* ca/pp.sec ca/myCA.crt
# remove the directories and files created by the CA

rm -rf server/server.csr server/server.crt server/server.key
# remove the files created by the server
