# wlniao/php

Repository: <https://github.com/wlniao/php>

[![Docker Pulls](https://img.shields.io/docker/pulls/wlniao/php.svg)](https://hub.docker.com/r/wlniao/php/)
![php 7.3](https://img.shields.io/badge/php-7.3-brightgreen.svg)
![nginx 1.16.1](https://img.shields.io/badge/nginx-1.16-brightgreen.svg)

## Usage

Start the Docker container:
```
docker run -p 80:80 wlniao/php:tag
```
mount folder directory
```
docker run -p 80:80 -v /src:/wwwroot wlniao/php:tag
```