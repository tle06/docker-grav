#!/usr/bin/bash

DIR="/var/www/grav"
# init
# look for empty dir 
if [ "$(ls -A $DIR)" ]; then
     echo "Grav already setup"
else
    echo "$DIR is Empty"
    echo "Setup grav"
    echo "Git clone grav"
    git clone https://github.com/getgrav/grav.git /var/www/grav

    echo "Setup composer"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php

    echo "Setup grav admin"
    /var/www/grav/bin/grav install

    echo "Install grav admin plugin"
    /var/www/grav/bin/gpm install admin -y

    echo "Setup permission for www-data"
    chown -R www-data:www-data /var/www/grav
    chmod -R 755 /var/www/grav
    echo "End setup"
fi
