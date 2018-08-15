#!/usr/bin/bash
#Configure php.ini
VAR_PHP_UPLOAD_MAX_FILESIZE="${PHP_UPLOAD_MAX_FILESIZE:-2M}"
VAR_PHP_POST_MAX_SIZE="${PHP_POST_MAX_SIZE:-8M}"
VAR_PHP_MEMORY_LIMIT="${PHP_MEMORY_LIMIT:-128M}"
VAR_PHP_FILE_UPLOAD="${PHP_FILE_UPLOAD:-On}"
VAR_PHP_ALLOW_URL="${PHP_ALLOW_URL:-On}"
#VAR_PHP_MAX_EXCUTION_TIME="${PHP_MAX_EXCUTION_TIME:-30}"

sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = $VAR_PHP_UPLOAD_MAX_FILESIZE/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = $VAR_PHP_POST_MAX_SIZE/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/memory_limit\s*=\s*128M/memory_limit = $VAR_PHP_MEMORY_LIMIT/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/file_uploads\s*=\s*On/file_uploads = $VAR_PHP_FILE_UPLOAD/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/allow_url_fopen\s*=\s*On/allow_url_fopen = $VAR_PHP_ALLOW_URL/g" /etc/php/7.2/apache2/php.ini

#sed -i -e "s/max_execution_time\s*=\s*30/max_execution_time = $VAR_PHP_MAX_EXCUTION_TIME/g" /etc/php/7.2/apache2/php.ini