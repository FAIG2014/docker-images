FROM fedora31-fpga_simu:latest

USER root


ARG MIRROR=https://xilinx-ax-dl.entitlenow.com/dl/ul/2019/05/26/R210193578/Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz/8151a1efd954283816df58bd98122569/5D4BAACB?akdm=0&filename=
ARG VIVADO=Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz

COPY install_config.txt /tmp/


# install using a locally downloaded (fast and dirty)
#COPY Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz /tmp/
#RUN cd /tmp \
#    && echo "untar xilinx" \
#    && tar -xzf Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz \
#    && cd Xilinx_Vivado_SDK_2019.1_0524_1430 \
#    && echo "installing Xilinx" \
#    && ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install -c /tmp/install_config.txt \
#    && echo "cleaning up" \
#    && cd /tmp \
#    && rm -rf * \
#    && rm -rf /root/.Xilinx 


# install using the wget (slow and clean)
RUN cd /tmp \
    && echo "download Xilinx from ${MIRROR}${VIVADO}" \
    && time wget -q $MIRROR$VIVADO \
    && echo "untar xilinx" \
    && tar -xzf Xilinx_Vivado_SDK_2019.1_0524_1430.tar.gz \
    && cd Xilinx_Vivado_SDK_2019.1_0524_1430 \
    && echo "installing Xilinx" \
    && ./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install -c /tmp/install_config.txt \
    && echo "cleaning up" \
    && cd /tmp \
    && rm -rf * \
    && rm -rf /root/.Xilinx 

RUN ln -s /lib64/libtinfo.so.6 /lib64/libtinfo.so.5 \
    && ln -s /lib64/libncurses.so.6 /lib64/libncurses.so.5

ENV PATH="/opt/xilinx/Vivado/2019.1/bin/:${PATH}"




