FROM nginx:1.30.7-alpine

COPY ./src/entrypoint.sh /entrypoint.sh
COPY ./src/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
