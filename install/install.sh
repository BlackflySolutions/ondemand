#!/bin/bash
# todo - separate out the test of whether there's already a database installed, perhaps using drush?
# Use my drush to do a standard Drupal install
if [ ! -f /var/www/html/sites/default/settings.php ]; then
  cd /var/www/html/sites/default
  cp /var/www/html/sites/default/default.settings.php settings.php
  chown www-data:www-data settings.php
  /usr/local/bin/wait-for-it.sh db:3306
  drush site-install minimal --db-url="mysql://$MYSQL_USER:$MYSQL_PASSWORD@db/$MYSQL_DATABASE" --yes \
   --site-name=$VSITE_NAME \
   --account-name=$VSITE_ADMIN \
   --account-pass=$VSITE_PASS 
fi
# todo - figure out how to install civi via the command line
# drush pm-enable civicrm --yes
# when this is working, we can remove this last command and the container will just disappear
apache2-foreground
