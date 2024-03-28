#!/bin/bash

TYPO3_VERSION="$TYPO3_VERSION"

if [ ! -d "/var/www/html/typo3_src" ]; then
    git clone https://github.com/TYPO3/typo3.git /var/www/typo3/$TYPO3_VERSION
    cd /var/www/typo3/$TYPO3_VERSION
    git checkout tags/$TYPO3_VERSION
    cp -r . /var/www/html/typo3_src
    cd /var/www/html/typo3_src
    composer update --no-dev
fi

cp /var/www/FaisToiPlaiz_template.php /var/www/html/FaisToiPlaiz_template.php

service apache2 start && service php7.4-fpm start

chmod 777 /var/www/html -R

tail -f /dev/null
