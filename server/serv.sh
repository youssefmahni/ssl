#!/bin/bash

SUBJ="/C=MA/ST=Khouribga/L=Khouribga/O=1337CodingSchool/CN=ymahni.42.fr"


openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr -subj $SUBJ
# generate a private key and a certificate signing request
