#!/bin/bash
set -e


docker build -t fedora-gui fedora31-gui


docker build -t fedora-modelsim fedora31-modelsim
docker build -t fedora-fpga_simu fedora31-fpga_simu


docker build -t fedora-lattice_diamond fedora31-lattice_diamond