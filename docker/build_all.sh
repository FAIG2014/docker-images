#!/bin/bash
set -e

docker build -t centos-modelsim centos-modelsim


docker build -t fedora31-gui fedora-gui


docker build -t fedora31-modelsim fedora-modelsim
docker build -t fedora31-fpga_simu fedora-fpga_simu


docker build -t fedora31-lattice_diamond fedora-lattice_diamond