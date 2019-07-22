FROM fedora31-gui:latest

USER root


ARG MIRROR=http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/
ARG MODELSIM=ModelSimSetup-18.1.0.625-linux.run



ENV QUARTUS_INSTALL_DIR=/opt/intelFPGA/18.0

RUN yum install -y unixODBC.i686 ncurses-compat-libs-6.1-10.20180923.fc30.i686 ncurses-libs.i686 libXext.i686 \
                    glibc.i686 libXft.i686 libpng15.i686


# install using a locally downloaded binary (fast and dirty)
#COPY $MODELSIM /tmp/
#RUN /tmp/$MODELSIM --mode unattended --installdir $QUARTUS_INSTALL_DIR  --modelsim_edition modelsim_ase --accept_eula 1


# install using the wget (slow and clean)
RUN cd /tmp \
    && echo "download modelsim" \
    && wget $MIRROR$MODELSIM \
    && echo "install modelsim" \
    && chmod +x /tmp/$MODELSIM \
    && /tmp/$MODELSIM --mode unattended --installdir $QUARTUS_INSTALL_DIR  --modelsim_edition modelsim_ase --accept_eula 1 \
    && echo "clean up" \
    && rm /tmp/$MODELSIM


ENV PATH="${QUARTUS_INSTALL_DIR}/modelsim_ase/bin:${PATH}"
ENV QT_GRAPHICSSYSTEM "native"



# to solve the problem: "With the kernel 4.x and Upwards"
RUN ln -s $QUARTUS_INSTALL_DIR/modelsim_ase/linux $QUARTUS_INSTALL_DIR/modelsim_ase/linux_rh60



#solve "With freetype2 2.5.0.1-1"
RUN mkdir $QUARTUS_INSTALL_DIR/lib32
RUN mkdir /tmp/freetype2 \
    && cd /tmp/freetype2 \
    && wget https://rpmfind.net/linux/centos/6.10/os/i386/Packages/freetype-2.3.11-17.el6.i686.rpm \
    && rpm2cpio freetype-2.3.11-17.el6.i686.rpm | cpio -idmv \
    && cp usr/lib/* /$QUARTUS_INSTALL_DIR/lib32/ \
    && cd /tmp/ \
    && rm -fr /tmp/freetype2




#solve "With fontconfig 2.12.6"
RUN mkdir /tmp/fontconfig \
    && cd /tmp/fontconfig \
    && wget https://rpmfind.net/linux/centos/6.10/os/i386/Packages/fontconfig-2.8.0-5.el6.i686.rpm \
    && rpm2cpio fontconfig-2.8.0-5.el6.i686.rpm | cpio -idmv \
    && cp usr/lib/* /$QUARTUS_INSTALL_DIR/lib32/ \
    && cd /tmp/ \
    && rm -fr /tmp/fontconfig


RUN cp $QUARTUS_INSTALL_DIR/modelsim_ase/vco $QUARTUS_INSTALL_DIR/modelsim_ase/vco.bak \
    && sed 's/.*dir=`dirname.*/&\nexport LD_LIBRARY_PATH=\$\{dir\}\/..\/lib32/' $QUARTUS_INSTALL_DIR/modelsim_ase/vco.bak > $QUARTUS_INSTALL_DIR/modelsim_ase/vco
