FROM fedora31-modelsim:latest

USER root



RUN yum install -y gperf flex bison g++ python pip python-devel \
    && yum clean all


RUN mkdir /tmp/iverilog \
    && cd /tmp/iverilog \
    && git clone https://github.com/steveicarus/iverilog.git \
    && cd iverilog \
    && ls -la \
    && sh autoconf.sh \
    && ./configure \
    && make -j 4 \
    && make install \
    && cd /tmp \
    && rm -fr *



