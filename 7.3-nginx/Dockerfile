FROM alpine:3.10
LABEL Maintainer="Wlniao <wlniao@qq.com>" \
      Description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux."

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-bcmath php7-fileinfo php7-posix php7-pcntl \
    php7-zlib php7-xml php7-simplexml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session php7-pdo php7-pdo_mysql \
    php7-mbstring php7-gd php7-xmlrpc nginx supervisor curl

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY src/ /wwwroot/
RUN chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/log/nginx && \
  chown -R nobody.nobody /wwwroot && \
  chown -R root.root /var/tmp/nginx && \
  chmod -R 777 /var/tmp/nginx && \
  mkdir /var/tmp/nginx/client_body 
USER nobody
USER root
EXPOSE 80
WORKDIR /wwwroot
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping