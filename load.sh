#!/bin/sh
sudo /usr/local/nginx/sbin/nginx -s stop && sudo > /usr/local/nginx/logs/mytest.log
./configure --add-module=../ngx_http_substitutions_filter_module  --with-http_gunzip_module --with-debug
sed -i -e '/^ *&ngx_http_gunzip/i\    &ngx_http_subs_filter_module,' -e '/^ *&ngx_http_subs/d' objs/ngx_modules.c
#./configure --add-module=../ngx_http_substitutions_filter_module  --with-debug
make && sudo make install
sudo /usr/local/nginx/sbin/nginx && sudo /usr/local/nginx/sbin/nginx -s reload
