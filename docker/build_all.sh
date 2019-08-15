#!/bin/bash
set -e


docker build -t fedora31-gui fedora-gui


docker build -t fedora31-modelsim fedora-modelsim
docker build -t fedora31-fpga_simu fedora-fpga_simu


#xilinx
docker build -t fedora31-xilinx_vivado fedora-xilinx_vivado

# lattice
docker build -t fedora31-lattice_diamond fedora-lattice_diamond

#intel FPGA
docker build -t fedora31-intel_quartus fedora-intel_quartus
