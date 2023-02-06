FROM openresty/openresty:xenial

# install dependencies
RUN ["luarocks", "install", "lua-resty-session"]
RUN ["luarocks", "install", "lua-resty-openidc"]
RUN ["luarocks", "install", "lua-resty-http"]
RUN ["luarocks", "install", "lua-resty-jwt"]

COPY conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY conf/nginx_api.conf /usr/local/openresty/nginx/conf/nginx_api.conf
COPY conf/authz.conf /usr/local/openresty/nginx/conf/authz.conf
COPY conf/authz_api.conf /usr/local/openresty/nginx/conf/authz_api.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
