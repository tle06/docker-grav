#Dockerfile docker-grav
FROM nginx:latest
LABEL tlnk <support@tlnk.fr>

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

EXPOSE 80

#Install packages
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nano \
    git \
    zip \
    unzip \
    nginx \
    php7.0-fpm \
    php7.0-cli \
    php7.0-gd \
    php7.0-curl \
    php7.0-mbstring \
    php7.0-xml \
    php7.0-zip \
    php-apcu

COPY entrypoint /entrypoint

RUN git clone -b master https://github.com/getgrav/grav.git /usr/share/nginx/html && \
    cd /usr/share/nginx/html/ && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    php bin/composer.phar install --no-dev -o && \
    bin/grav install && \
    apt-get clean && \
    chmod +x /entrypoint/*sh && \
    chmod +x /entrypoint/entrypoint.d/*.sh

COPY .htaccess /usr/share/nginx/html/.htaccess
WORKDIR /usr/share/nginx/html/

ENTRYPOINT ["/bin/bash", "/entrypoint/entrypoint.sh"]
CMD ["php", "-S", "localhost:8000", "/usr/share/nginx/html/system/router.php"]


LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/tle06/docker-grav.git"
LABEL org.label-schema.name="docker-grav"
LABEL org.label-schema.vendor="docker-grav"
LABEL org.label-schema.schema-version="1.0"