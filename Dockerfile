FROM centos:latest
MAINTAINER 106140873@qq.com
RUN set -ex \
    && yum install -y openssh-server \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_ed25519_key -N '' \
    && echo "123123" | passwd --stdin root

ADD run.sh /run.sh
EXPOSE 22
CMD ["/run.sh"]
