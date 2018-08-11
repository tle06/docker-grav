#Dockerfile docker-grav
FROM ubuntu:latest
LABEL tlnk <support@tlnk.fr>

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

EXPOSE 80

#Install packages
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y nano \
    git \
    zip \
    unzip \
    apache2 \
    php7.2 \
    libapache2-mod-php7.2 \
    php7.2-common \
    php7.2-mbstring \
    php7.2-xmlrpc \
    php7.2-soap \
    php7.2-gd \
    php7.2-xml \
    php7.2-cli \
    php7.2-curl \
    php7.2-zip

COPY entrypoint /entrypoint
COPY grav.conf /etc/apache2/sites-available/grav.conf

RUN mkdir /var/www/grav && \
    git clone https://github.com/getgrav/grav.git /var/www/grav && \
    /var/www/grav/bin/grav install && \
    chown -R www-data:www-data /var/www/grav/ && \
    chmod -R 755 /var/www/grav && \
    a2ensite grav.conf && \
    a2enmod rewrite && \
    a2enmod proxy proxy_fcgi rewrite && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apache2/sites-available/default-ssl.conf && \
    rm -rf /var/www/html && \
    chmod +x /entrypoint/*sh && \
    chmod +x /entrypoint/entrypoint.d/*.sh

WORKDIR /var/www/grav/bin/grav

ENTRYPOINT ["/bin/bash", "/entrypoint/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/tle06/docker-grav.git"
LABEL org.label-schema.name="docker-grav"
LABEL org.label-schema.vendor="docker-grav"
LABEL org.label-schema.schema-version="1.0"