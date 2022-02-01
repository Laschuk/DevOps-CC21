FROM php:8.1.1-apache-bullseye

RUN apt update && \
    apt install -y wget vim curl && \
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN echo '<?php phpinfo(); ?>' > /var/www/html/index.php