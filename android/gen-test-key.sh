#!/bin/bash
LOCAL_PATH=$(cd `dirname $0`; pwd)
cd $LOCAL_PATH

#password 666666
keytool -genkey -v -keystore ./key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
# keytool -importkeystore -srckeystore ./test.keystore -destkeystore ./test.keystore -deststoretype pkcs12