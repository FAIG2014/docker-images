FROM fedora:31

USER root

RUN    yum -y groupinstall 'Development Tools' \
    && yum clean all


RUN    yum -y groupinstall 'base-x' \
    && yum clean all


RUN    yum -y install wget dpkg firefox which vim \
    && yum clean all

# install gosu for a better su+exec command
ARG GOSU_VERSION=1.10
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
 && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
 && chmod +x /usr/local/bin/gosu \
 && gosu nobody true 


COPY adduser.conf /etc/adduser.conf
COPY entrypoint.sh /usr/local/bin/entrypoint_fedora31-gui.sh
COPY .bashrc /usr/.bashrc

# Give ourselves sudo
RUN    mkdir -p /etc/sudoers.d \
    && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/user \
    && chmod 0440 /etc/sudoers.d/user \
    && chmod +x /usr/local/bin/entrypoint_fedora31-gui.sh /usr/local/bin/gosu

ENV QT_GRAPHICSSYSTEM "native"

ENTRYPOINT ["/usr/local/bin/entrypoint_fedora31-gui.sh"]