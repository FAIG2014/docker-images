FROM fedora:30


USER root

ARG MIRROR=http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/
ARG MODELSIM=ModelSimSetup-18.1.0.625-linux.run


ENV QT_GRAPHICSSYSTEM "native"
ENV QUARTUS_INSTALL_DIR=/opt/intelFPGA/18.0

# install few things that will be needed for the install
RUN    yum -y install wget python cpio \
    && yum clean all

# install 32b libs for modelsim
RUN yum install -y unixODBC.i686 ncurses-compat-libs.i686 ncurses-libs.i686 libXext.i686 \
                    glibc.i686 libXft.i686 libpng15.i686 \
    && yum clean all


# install using the wget
RUN cd /tmp \
    && echo "downloading modelsim" \
    && wget -q $MIRROR$MODELSIM \
    && echo "installing modelsim" \
    && chmod +x /tmp/$MODELSIM \
    && /tmp/$MODELSIM --mode unattended --installdir $QUARTUS_INSTALL_DIR  --modelsim_edition modelsim_ase --accept_eula 1 \
    && echo "cleaning up" \
    && rm /tmp/$MODELSIM



ENV PATH="${QUARTUS_INSTALL_DIR}/modelsim_ase/bin:${PATH}"

#https://github.com/neo0x3d/intelfpga-altera-modelsim-on-fedora
#https://wiki.archlinux.org/index.php/Altera_Design_Software#With_freetype2_2.5.0.1-1


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



# text requierement
RUN    yum -y install  python3-tox \
    && yum clean all
