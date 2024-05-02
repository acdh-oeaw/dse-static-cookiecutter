FROM nginx

# Copy HTML files into container
COPY html /usr/share/nginx/html

# uncomment next two lines to enable basic authentication for your server
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY .htpasswd /etc/nginx/.htpasswd

RUN chmod -R 755 /usr/share/nginx/html
