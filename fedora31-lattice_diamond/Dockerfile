FROM fedora31-gui:latest

USER root


ARG MIRROR=http://files.latticesemi.com/Diamond/3.11/
ARG DIAMOND=diamond_3_11-base_x64-396-4-x86_64-linux.rpm


RUN    yum -y install wget \
    && yum clean all
#http://files.latticesemi.com/Diamond/3.11/diamond_3_11-base_x64-396-4-x86_64-linux.rpm



RUN ls -la


RUN cd /tmp \
    && wget -q $MIRROR$DIAMOND

#RUN    yum install -y /tmp/$DIAMOND \
#    && rm $DIAMOND


COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]


