From nginx:alpine
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
         && apk update \
         && apk add --no-cache aria2 \
         && apk add --no-cache bash
COPY ./aria2.conf /config/aria2.conf
COPY ./aria2.session /config/aria2.session
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./start.sh /config/start.sh
RUN chmod 777 /config/start.sh
EXPOSE 6800
EXPOSE 80
ENTRYPOINT ["/bin/bash","/config/start.sh"]
