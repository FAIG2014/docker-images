FROM fedora31-fpga_simu:latest

USER root


ARG MIRROR=http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/
ARG QUARTUS=QuartusLiteSetup-18.1.0.625-linux.run
ARG DEVICE_CYCLONE=cyclone-18.1.0.625.qdz


ENV QT_GRAPHICSSYSTEM "native"
ENV INTEL_FPGA_INSTALL_DIR=/opt/intelFPGA/18.1



RUN yum install -y libnsl.x86_64 libpng12.x86_64 \
    && yum clean all
    

# install using a locally downloaded binary (fast and dirty)
#COPY $QUARTUS /tmp/
#COPY $DEVICE_CYCLONE /tmp/
#RUN echo "installing quartus" \
#    && /tmp/$QUARTUS --mode unattended --installdir $INTEL_FPGA_INSTALL_DIR --accept_eula 1 \
#    && echo "docker creating diff" 


# install using the wget (slow and clean)
RUN cd /tmp \
    && echo "downloading quartus from: ${MIRROR}" \
    && wget -q $MIRROR$QUARTUS \
    && wget -q $MIRROR$DEVICE_CYCLONE \
    && echo "installing quartus" \
    && chmod +x /tmp/$QUARTUS \
    && /tmp/$QUARTUS --mode unattended --installdir $INTEL_FPGA_INSTALL_DIR  --accept_eula 1 \
    && echo "cleaning up" \
    && rm /tmp/$QUARTUS \
    && rm /tmp/$DEVICE_CYCLONE \
    && rm /tmp/* \
    && echo "docker creating diff" 


ENV PATH="${INTEL_FPGA_INSTALL_DIR}/quartus/bin:${PATH}"

