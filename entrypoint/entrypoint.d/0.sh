#!/usr/bin/bash
#Configure php.ini
VAR_PHP_UPLOAD_MAX_FILESIZE="${PHP_UPLOAD_MAX_FILESIZE:-2M}"
VAR_PHP_POST_MAX_SIZE="${PHP_POST_MAX_SIZE:-8M}"
VAR_PHP_MEMORY_LIMIT="${PHP_MEMORY_LIMIT:-128M}"
VAR_PHP_FILE_UPLOAD="${PHP_FILE_UPLOAD:-On}"
VAR_PHP_ALLOW_URL="${PHP_ALLOW_URL:-On}"
#VAR_PHP_MAX_EXCUTION_TIME="${PHP_MAX_EXCUTION_TIME:-30}"
VAR_PHP_CONFIG_APPLIED="${PHP_CONFIG_APPLIED:-false}"

if [ "${VAR_PHP_CONFIG_APPLIED}" = true ]; then
     echo "PHP config already applied once, upgrade to applied new one"
else

echo "[CONFIG] upload_max_filesize with:${VAR_PHP_UPLOAD_MAX_FILESIZE}"
sed -i -e "s/upload_max_filesize\s*=\s*2M/upload_max_filesize = $VAR_PHP_UPLOAD_MAX_FILESIZE/g" /etc/php/7.2/apache2/php.ini
echo "[CONFIG] post_max_size with:${VAR_PHP_POST_MAX_SIZE}"
sed -i -e "s/post_max_size\s*=\s*8M/post_max_size = $VAR_PHP_POST_MAX_SIZE/g" /etc/php/7.2/apache2/php.ini
echo "[CONFIG] memory_limit with:${VAR_PHP_MEMORY_LIMIT}"
sed -i -e "s/memory_limit\s*=\s*128M/memory_limit = $VAR_PHP_MEMORY_LIMIT/g" /etc/php/7.2/apache2/php.ini
echo "[CONFIG] file_uploads with:${VAR_PHP_FILE_UPLOAD}"
sed -i -e "s/file_uploads\s*=\s*On/file_uploads = $VAR_PHP_FILE_UPLOAD/g" /etc/php/7.2/apache2/php.ini
echo "[CONFIG] allow_url_fopen with:${VAR_PHP_ALLOW_URL}"
sed -i -e "s/allow_url_fopen\s*=\s*On/allow_url_fopen = $VAR_PHP_ALLOW_URL/g" /etc/php/7.2/apache2/php.ini
#sed -i -e "s/max_execution_time\s*=\s*30/max_execution_time = $VAR_PHP_MAX_EXCUTION_TIME/g" /etc/php/7.2/apache2/php.ini

VAR_PHP_CONFIG_APPLIED=true

fi

echo "export PHP_CONFIG_APPLIED=${VAR_PHP_CONFIG_APPLIED}" >> ~/.bashrc