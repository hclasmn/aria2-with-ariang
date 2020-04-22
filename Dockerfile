From nginx:alpine
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
         && apk update \
         && apk add --no-cache aria2
COPY ./aria2.conf /config/aria2.conf
COPY ./aria2.session /config/aria2.session
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN nginx
EXPOSE 6800
EXPOSE 80
#CMD ["aria2c","-c","--conf-path=/config/aria2.conf"]
ENTRYPOINT ["aria2c","-c","--conf-path=/config/aria2.conf"]