FROM fedora31-fpga_simu:latest

USER root


ARG MIRROR=http://files.latticesemi.com/Diamond/3.11/
ARG DIAMOND=diamond_3_11-base_x64-396-4-x86_64-linux.rpm


RUN yum install -y freetype libSM libXrender fontconfig libXext libXt net-tools \
    && yum clean all
ENV QT_GRAPHICSSYSTEM "native"






# install using a locally downloaded rpm (fast and dirty)
#COPY diamond_3_11-base_x64-396-4-x86_64-linux.rpm /tmp/
#RUN sudo rpm -Uvh /tmp/diamond_3_11-base_x64-396-4-x86_64-linux.rpm


# install using the wget (slow and clean)
RUN cd /tmp \
    && echo "downloading lattice diamond from: ${MIRROR}" \
    && time wget -q $MIRROR$DIAMOND \
    && echo "installing lattice diamond" \
    && time yum install -y /tmp/$DIAMOND \
    && echo "cleaning up" \
    && rm -fr /tmp/* \
    && yum clean all


ENV PATH="/usr/local/diamond/3.11_x64/bin/lin64/:${PATH}"
COPY license.dat /usr/local/diamond/3.11_x64/license/license.dat
COPY diamond-doc /usr/bin/



