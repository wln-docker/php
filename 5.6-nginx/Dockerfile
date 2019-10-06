FROM ubuntu:trusty
MAINTAINER WlniaoStudio <ideploy@wlniao.com>
ENV WLN_STARTUP_ROOT /wln
ENV WLN_LISTEN_PORT 80
EXPOSE 80
WORKDIR /wln
RUN apt-get update \
    && apt-get -y install \
        curl \
        wget \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-sqlite \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc \

    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    # 安装 Composer，此物是 PHP 用来管理依赖关系的工具
    # Laravel Symfony 等时髦的框架会依赖它
    && curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin --filename=composer

# Apache 2 配置文件：/etc/apache2/apache2.conf
# 给 Apache 2 设置一个默认服务名，避免启动时给个提示让人紧张.
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \

    # PHP 配置文件：/etc/php5/apache2/php.ini
    # 调整 PHP 处理 Request 里变量提交值的顺序，解析顺序从左到右，后解析新值覆盖旧值
    # 默认设定为 EGPCS（ENV/GET/POST/COOKIE/SERVER）
    && sed -i 's/variables_order.*/variables_order = "EGPCS"/g' \
        /etc/php5/apache2/php.ini

ADD ./start.sh /start.sh
RUN chmod 777 /start.sh && rm /var/www/html -rf && mkdir /var/www/html && chmod -R 777 /var/www/html
WORKDIR /var/www/html
ENTRYPOINT ["/bin/bash", "/start.sh"]
ONBUILD COPY . /var/www/html