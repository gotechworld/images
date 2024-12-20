FROM --platform=linux/amd64 alpine:3.21.0

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="git@gitlab.altex.ro:iac/images.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="PHP.altex" \
      org.label-schema.name="docker-php" \
      org.label-schema.description="Docker For PHP Developers - Docker image with PHP 7.3, Nginx, and Alpine" \
      org.label-schema.url="https://gitlab.altex.ro/iac/images.git"

# PHP_INI_DIR to be symmetrical with official php docker image
ENV PHP_INI_DIR /etc/php/7.3

# When using Composer, disable the warning about running commands as root/super user
ENV COMPOSER_ALLOW_SUPERUSER=1

# Persistent runtime dependencies
ARG DEPS="\
        nginx \
        nginx-mod-http-headers-more \
        php7.3 \
        php7.3-phar \
        php7.3-bcmath \
        php7.3-calendar \
        php7.3-mbstring \
        php7.3-exif \
        php7.3-ftp \
        php7.3-openssl \
        php7.3-zip \
        php7.3-sysvsem \
        php7.3-sysvshm \
        php7.3-sysvmsg \
        php7.3-shmop \
        php7.3-sockets \
        php7.3-zlib \
        php7.3-bz2 \
        php7.3-curl \
        php7.3-simplexml \
        php7.3-xml \
        php7.3-opcache \
        php7.3-dom \
        php7.3-xmlreader \
        php7.3-xmlwriter \
        php7.3-tokenizer \
        php7.3-ctype \
        php7.3-session \
        php7.3-fileinfo \
        php7.3-iconv \
        php7.3-json \
        php7.3-posix \
        php7.3-fpm \
        php7.3-pdo \
        php7.3-redis \
        curl \
        ca-certificates \
        runit \
"

# PHP.earth Alpine repository for better developer experience
ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

RUN set -x \
    && echo "https://repos.php.earth/alpine/v3.9" >> /etc/apk/repositories \
    && apk add --no-cache $DEPS \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /var/log/supervisor/ /etc/supervisor.d/conf.d/ /configs /etc/nginx/conf.d/ \
    && apk add nginx tzdata supervisor bash git vim \
    && echo "upstream php-upstream { server unix:/run/php/php-fpm.sock; }" > /etc/nginx/conf.d/upstream.conf

RUN cp /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

RUN if [ -d /var/lib/nginx ];then chown -R www-data:www-data /var/lib/nginx; fi

COPY tags/nginx /
COPY tags/supervisord/supervisord.conf /etc/supervisord.conf
COPY tags/supervisord/supervisor_nginx_fpm.conf /etc/supervisor.d/conf.d/nginx-fpm.conf

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n", "-j", "/supervisord.pid"]

