#### Building SV-TV image ####
FROM alfg/nginx-rtmp

# Configuring nginx
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /out && chmod 777 /out

CMD ["/usr/local/nginx/sbin/nginx"]

