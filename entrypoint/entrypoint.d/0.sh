#!/usr/bin/bash
#Configure php.ini
sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = $PHP_UPLOAD_MAX_FILESIZE/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = $PHP_POST_MAX_SIZE/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/max_execution_time\s*=\s*30/max_execution_time = $PHP_MAX_EXCUTION_TIME/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/memory_limit\s*=\s*128M/memory_limit = $PHP_MEMORY_LIMIT/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/file_uploads\s*=\s*off/file_uploads = $PHP_FILE_UPLOAD/g" /etc/php/7.2/apache2/php.ini
sed -i -e "s/allow_url_fopen\s*=\s*off/allow_url_fopen = $PHP_ALLOW_URL/g" /etc/php/7.2/apache2/php.ini
