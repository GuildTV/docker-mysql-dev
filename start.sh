#!/bin/bash

if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
  export MYSQL_ROOT_PASSWORD="examplePassword"
fi
if [ -z "$MYSQL_USERNAME" ]; then
  export MYSQL_USERNAME="Dev"
fi
if [ -z "$MYSQL_PASSWORD" ]; then
  export MYSQL_PASSWORD="examplePassword"
fi

#start the setup script
bash /setup.sh &

#start the server
bash /entrypoint.sh mysqld