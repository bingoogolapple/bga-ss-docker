FROM node:10.15.1-alpine 
LABEL maintainer="bingoogolapple@gmail.com"

COPY ssmgr /etc/ssmgr
COPY bga-ss /usr/bin/

RUN echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories \
  && echo "https://mirrors.tuna.tsinghua.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories \
  && apk -U --no-cache --allow-untrusted add bash screen py-pip \
  && pip install --upgrade pip \
  && pip install shadowsocks==2.8.2 \
  && npm i -g shadowsocks-manager@0.30.17 --unsafe-perm \
  && chmod +x /usr/bin/bga-ss

CMD [ "bga-ss" ]

# docker stop bga-ss-redis && docker rm bga-ss-redis
# docker run --name bga-ss-redis -d redis:5.0.3-alpine

# docker stop bga-ss && docker rm bga-ss && docker rmi bingoogolapple/bga-ss:v5
# docker build -t bingoogolapple/bga-ss:v5 .
# docker login
# docker push bingoogolapple/bga-ss:v5
# docker run -d -p 8003:8003 -p 6660-6680:6660-6680 --link bga-ss-redis --name bga-ss bingoogolapple/bga-ss:v5