#Dockerfile docker-grav
FROM ubuntu:latest
LABEL tlnk <support@tlnk.fr>

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

EXPOSE 80

#Install packages
RUN apt-get update -y && \
    apt-get install -y software-properties-common tzdata && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nano \
    wget \
    git \
    unzip \
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
    php7.2-zip \
    php7.2-ldap

COPY entrypoint /entrypoint
COPY apache_app.conf /etc/apache2/sites-available/grav.conf

RUN git clone https://github.com/getgrav/grav.git /var/www/grav && \
    cd /var/www/grav && \
    wget https://getcomposer.org/installer -o composer-setup.php && \
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    /var/www/grav/bin/grav install && \
    /var/www/grav/bin/gpm install admin -y && \
    chown -R www-data:www-data /var/www/grav/ && \
    chmod -R 755 /var/www/grav/ && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2ensite grav.conf && \
    a2enmod rewrite && \
    a2enmod proxy proxy_fcgi rewrite && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/000-default.conf&& \
    rm -rf /var/www/html && \
    rm -rf /var/www/grav.zip && \
    chmod +x /entrypoint/*sh && \
    chmod +x /entrypoint/entrypoint.d/*.sh

WORKDIR /var/www/grav

ENTRYPOINT ["/bin/bash", "/entrypoint/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/tle06/docker-grav.git"
LABEL org.label-schema.name="docker-grav"
LABEL org.label-schema.vendor="docker-grav"
LABEL org.label-schema.schema-version="1.0"