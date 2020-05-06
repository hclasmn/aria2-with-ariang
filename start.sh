#nginx && aria2c -c --conf-path=/config/aria2.conf
aria2c -D -c --conf-path=/config/aria2.conf

nginx -g 'daemon off;'
