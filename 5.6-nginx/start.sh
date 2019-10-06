#!/bin/bash
chmod -R 777 /var/www/html
source /etc/apache2/envvars
tail -F /var/log/apache2/* &
exec apache2 -D FOREGROUND