#!/usr/bin/bash

DIR="/var/www/grav"
# init
# look for empty dir 
if [ "$(ls -A $DIR)" ]; then
     echo "Grav already setup"
else
    echo "$DIR is Empty"
    echo "Setup grav"
    # cd /var/www
    # wget https://getgrav.org/download/core/grav-admin/1.4.8 -O grav.zip
    # unzip grav.zip
    # mv grav-admin/ /var/www/grav
    git clone https://github.com/getgrav/grav.git /var/www/grav
    /var/www/grav/bin/grav install

    echo "Install grav admin plugin"
    /var/www/grav/bin/gpm install admin -y

    echo "Setup permission for www-data"
    chown -R www-data:www-data /var/www/grav
    chmod -R 755 /var/www/grav
fi
