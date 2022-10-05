#!/bin/bash

#Install Oracle client
mkdir -p /home/vcap/app/oracle
curl -L https://download.oracle.com/otn_software/linux/instantclient/215000/instantclient-basiclite-linux.x64-21.5.0.0.0dbru.zip \
    -o oracle/instantclient-basiclite-linux.x64-21.5.0.0.0dbru.zip
unzip oracle/instantclient-basiclite-linux.x64-21.5.0.0.0dbru.zip -d oracle
rm oracle/instantclient-basiclite-linux.x64-21.5.0.0.0dbru.zip
curl -L https://download.oracle.com/otn_software/linux/instantclient/215000/instantclient-sqlplus-linux.x64-21.5.0.0.0dbru.zip \
    -o oracle/instantclient-sqlplus-linux.x64-21.5.0.0.0dbru.zip
unzip oracle/instantclient-sqlplus-linux.x64-21.5.0.0.0dbru.zip -d oracle
rm oracle/instantclient-sqlplus-linux.x64-21.5.0.0.0dbru.zip
cat > oracle/instantclient_21_5/network/admin/tnsname.ora <<EOL
spire=
  (DESCRIPTION=
    (ADDRESS=(PROTOCOL=tcp)(HOST=$ORACLE_SERVER_IP)(PORT=1521))
    (CONNECT_DATA=
      (SERVICE_NAME=$SERVICE_NAME)))
EOL
export LD_LIBRARY_PATH=/home/vcap/app/deps/0/python/lib:/home/vcap/app/oracle/instantclient_21_5
export ORACLE_SID=$ORACLE_SID
export ORACLE_HOME=/home/vcap/oracle/instantclient_21_5
