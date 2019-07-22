#!/bin/bash
set -e


docker build -t fedora31-gui fedora31-gui


docker build -t fedora31-modelsim fedora31-modelsim



docker build -t fedora31-lattice_diamond fedora31-lattice_diamond