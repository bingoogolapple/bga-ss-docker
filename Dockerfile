FROM centos:7.2.1511
LABEL maintainer="bingoogolapple@gmail.com"

RUN yum -y update
RUN yum -y install python-setuptools && easy_install pip
RUN pip install shadowsocks

RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs

RUN npm i -g shadowsocks-manager@0.19.7

RUN yum -y install screen

COPY ssmgr /etc/ssmgr

COPY bga-ss /usr/bin/

RUN chmod +x /usr/bin/bga-ss

CMD [ "bga-ss" ]