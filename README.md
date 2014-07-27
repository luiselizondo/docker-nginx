This is a container that uses Nginx

You can provide a "default" with your vhost configuration, I'm providing two examples in the config directory:

- default-example.conf This is a very simple example file, if you don't provide a configuration file, this one will be used
- proxy-example.conf This is a proxy example on how to run nginx to respond to different subdomains.


## Configurations
Nginx will look for some configurations in some directories so you need to mount your directories to point to the right directories.

- /var/www This is the the place where your files go
- /etc/nginx/sites-enabled This is the place where you should put your nginx vhosts configuration files.
- /var/log/supervisor This is where all logs are saved, including supervisor and nginx log files

## Run

	To run as proxy:

	docker run -d -v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled -v /var/www/webfiles:/var/www -v /var/log/docker:/var/log/supervisor --name proxy --net=host -p 80:80 image/nginx

Notice the --net=host, it's necessary so the container can access the host.

	To run as a simple web server:

	docker run -d -v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled -v /var/www/webfiles:/var/www -v /var/log/docker:/var/log/supervisor --name http -p 80:80 image/nginx