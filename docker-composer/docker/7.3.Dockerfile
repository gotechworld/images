FROM php:7.3.15-fpm-alpine3.11

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="git@gitlab.altex.ro:iac/images.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vendor="PHP.altex" \
      org.label-schema.name="docker-composer" \
      org.label-schema.description="Docker For PHP Developers - Docker image with PHP 7.3, Composer and Alpine" \
      org.label-schema.url="https://gitlab.altex.ro/iac/images.git"

ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION 2.0.14
ENV COMPOSER_ALLOW_SUPERUSER 1

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version $COMPOSER_VERSION

CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]

