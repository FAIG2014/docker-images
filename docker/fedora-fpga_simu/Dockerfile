FROM fedora31-modelsim:latest

USER root



RUN yum install -y gperf flex bison g++ python pip python-devel \
    && yum clean all



# install icarus verilog
RUN mkdir /tmp/iverilog \
    && cd /tmp/iverilog \
    && git clone https://github.com/steveicarus/iverilog.git \
    && cd iverilog \
    && sh autoconf.sh \
    && ./configure \
    && make -j 4 \
    && make install \
    && cd /tmp \
    && rm -fr *


# install hdl-make: https://www.veripool.org/projects/verilator/wiki/Installing

RUN yum install -y make autoconf g++ flex bison \
    && yum clean all

RUN mkdir /tmp/verilator \
    && cd /tmp/verilator \
    && wget https://www.veripool.org/ftp/verilator-4.016.tgz \
    && ls -la \
    && tar xvzf verilator-4.016.tgz \
    && ls -la \
    && cd verilator-4.016 \
    && ./configure \
    && make -j 5 \
    && make install \
    && cd /tmp \
    && rm -fr *




# TODO: add vivado simulator



