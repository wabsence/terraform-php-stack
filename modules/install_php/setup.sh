#!/bin/bash

sudo apt-get update \
    && sudo apt-get install -y gnupg gosu curl ca-certificates libcap2-bin libpng-dev python3 \
    && sudo mkdir -p ~/.gnupg \
    && sudo chmod 600 ~/.gnupg \
    && sudo echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && sudo echo "keyserver hkp://keyserver.ubuntu.com:80" >> ~/.gnupg/dirmngr.conf \
    && sudo gpg --recv-key 0x14aa40ec0831756756d7f66c4f4ea0aae5267a6c \
    && sudo gpg --export 0x14aa40ec0831756756d7f66c4f4ea0aae5267a6c > /usr/share/keyrings/ppa_ondrej_php.gpg \
    && sudo echo "deb [signed-by=/usr/share/keyrings/ppa_ondrej_php.gpg] https://ppa.launchpadcontent.net/ondrej/php/ubuntu jammy main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && sudo apt-get update \
    && sudo apt-get install -y php$1-cli php$1-dev php$1-fpm\
       php$1-pgsql php$1-sqlite3 php$1-gd \
       php$1-curl php$1-imap php$1-mysql php$1-mbstring \
       php$1-xml php$1-zip php$1-bcmath php$1-soap \
       php$1-intl php$1-readline php$1-ldap