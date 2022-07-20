FROM nginx:alpine

# ADD Custom Config
ADD ./tags/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./tags/nginx/default.conf /etc/nginx/conf.d/default.conf

#####################################
# Various:
#####################################
WORKDIR /var/www

RUN cp /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

RUN if [ -d /var/lib/nginx ];then chown -R nginx:nginx /var/lib/nginx; fi

#####################################
# Make Directory - Workspace
#####################################
RUN mkdir -p /var/www/html

#####################################
# Set Group to Workspace
#####################################
RUN chown nginx:nginx /var/www/html

EXPOSE 80
EXPOSE 443
