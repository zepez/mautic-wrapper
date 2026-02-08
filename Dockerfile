FROM mautic/mautic:7-apache

USER root

RUN mkdir -p /var/www/html/var/logs /var/www/html/var/cache \
    && chown -R www-data:www-data /var/www/html/var \
    && chmod -R u+rwX,g+rwX /var/www/html/var

USER www-data
