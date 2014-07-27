FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

# Let's get serf
RUN apt-get install -qy supervisor nginx

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

# Copy supervisor configuration
ADD ./config/nginx.conf /etc/nginx/nginx.conf
ADD ./config/default-example.conf /etc/nginx/sites-enabled/default
ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord-nginx.conf

EXPOSE 80

VOLUME ["/etc/nginx/sites-enabled", "/var/files"]

WORKDIR /var/www

CMD ["/usr/bin/supervisord", "-n"]
