FROM alpine:3.10
LABEL Maintainer="Wlniao <wlniao@qq.com>" \
      Description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux."

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-bcmath php7-fileinfo \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session \
    php7-mbstring php7-gd nginx supervisor curl

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod -R a+rw /var/lib/nginx && \
  chmod -R a+rw /var/tmp/nginx && \
  chmod -R a+rw /var/log/nginx


COPY src/ /wwwroot/
EXPOSE 80
VOLUME /wwwroot
WORKDIR /wwwroot
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping
