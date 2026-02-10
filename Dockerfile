FROM mautic/mautic:7-apache

USER root

# Ensure only one MPM is enabled
RUN a2dismod mpm_event mpm_worker || true \
    && a2enmod mpm_prefork || true

# Correct file permissions
RUN mkdir -p /var/www/html/var/logs /var/www/html/var/cache \
    && chown -R www-data:www-data /var/www/html/var \
    && chmod -R u+rwX,g+rwX /var/www/html/var
