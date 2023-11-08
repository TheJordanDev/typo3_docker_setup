#SETUP
FROM debian:11

ENV TYPO3_VERSION="11.5"

#Update and install common tools
RUN apt-get update && apt-get install -y wget curl apache2 nano git

#Install PHP & Apache2
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ bullseye main" > /etc/apt/sources.list.d/php.list

RUN apt-get update -y

RUN apt-get install -y \
    apache2 \
    libapache2-mpm-itk \
    libapache2-mod-fcgid

RUN apt-get install -y \
    curl \
    ghostscript \
    imagemagick \
    graphicsmagick \
    htop \
    xsltproc \
    catdoc \
    xpdf

# Installation Extensions PHP
RUN apt-get install -y php7.4-bz2 php7.4-cgi php7.4-cli php7.4-common php7.4-curl \
    php7.4-enchant php7.4-fpm php7.4-igbinary php7.4-imagick php7.4-imap \
    php7.4-intl php7.4-json php7.4-gd php7.4-gmp php7.4-ldap \
    php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-pspell \
    php7.4-readline php7.4-redis php7.4-soap php7.4-tidy \
    php7.4-xmlrpc php7.4-xml php7.4-xsl php7.4-zip libapache2-mod-php7.4 php7.4-memcached php7.4-uploadprogress

# Configuration Apache2
RUN a2dismod php7.4 mpm_itk mpm_prefork mpm_worker
RUN a2enconf php7.4-fpm
RUN a2enmod actions fcgid alias mpm_event rewrite headers
RUN a2enmod proxy_fcgi setenvif ssl
RUN a2dismod mpm_worker mpm_itk mpm_prefork && a2enmod mpm_event

# Setup des fichiers
COPY ./config/php.ini /etc/php/7.4/fpm/php.ini
COPY ./config/apache2.conf /etc/apache2/apache2.conf

RUN service apache2 restart && service php7.4-fpm restart

#Installation Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
COPY ./script/composer_install.sh /composer_install.sh
RUN chmod +x /composer_install.sh && /composer_install.sh

#Installation Typo3
RUN mkdir /var/www/typo3/

#####################################################
#                      Si il y a                    #
#                   Des problèmes avec              #
#                     HTTPS faire ça                #
#####################################################
# sed -i '/RewriteCond %{HTTPS} !=on/s/^#*/#/' /var/www/html/.htaccess
# sed -i '/RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]/s/^#*/#/' /var/www/html/.htaccess

COPY ./config/FaisToiPlaiz.php /var/www/FaisToiPlaiz_template.php

EXPOSE 80

COPY ./script/docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh", "$TYPO3_VERSION"]