#!/bin/bash

#wait before attempting anything
sleep 10

EXISTS=`mysql -p$MYSQL_ROOT_PASSWORD -e 'SHOW DATABASES LIKE "$MYSQL_USERNAME";'`

if [ -e "/example.sql" ] && [ -z "$EXISTS" ]; then    
  # Create a database with that name
  mysqladmin -u root -p$MYSQL_ROOT_PASSWORD create $MYSQL_USERNAME

  # Create a new user with same name as new db, with password 'pass'
  `mysql -u root -p$MYSQL_ROOT_PASSWORD -e "\
      GRANT ALL PRIVILEGES ON $MYSQL_USERNAME.* TO '$MYSQL_USERNAME'@'%' \
      IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; \
      FLUSH PRIVILEGES; "`

  # Import the SQL into new database
  `mysql -u root -p$MYSQL_ROOT_PASSWORD "$MYSQL_USERNAME" < /example.sql`

fi