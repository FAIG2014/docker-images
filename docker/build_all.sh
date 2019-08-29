#!/bin/bash
set -e


#
# it is assumed that our local appach is running
# docker run -dit --name tecmint-web -p 80:80 -v /home/francis/workspace/fpga-projects/:/usr/local/apache2/htdocs/ httpd:2.4
#
#

docker pull fedora:31

docker build -t fedora31-gui fedora-gui


# FPGA simulation
docker build -t fedora31-modelsim fedora-modelsim --build-arg MIRROR=http://192.168.1.189/docker/fedora-modelsim/
docker build -t fedora31-fpga_simu fedora-fpga_simu


#xilinx
docker build -t fedora31-xilinx_vivado fedora-xilinx_vivado --build-arg MIRROR=http://192.168.1.189/docker/fedora-xilinx_vivado/

# lattice
docker build -t fedora31-lattice_diamond fedora-lattice_diamond --build-arg MIRROR=http://192.168.1.189/docker/fedora-lattice_diamond/

#intel FPGA
docker build -t fedora31-intel_quartus fedora-intel_quartus --build-arg MIRROR=http://192.168.1.189/docker/fedora-intel_quartus/
