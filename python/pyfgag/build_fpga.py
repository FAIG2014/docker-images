#!/usr/bin/python3
"""
run build_fpga

Usage:
    build_fpga  <board_name> <top_name> [build_path=base_build_path]

Options:
    <board_name>           filter to run only a subset of our test files
    <top_name>             filter to run only a subset of our test files
    <file_name>            filter to run only a subset of our test files
"""

import os
import sys
import argparse
import docopt
import pyfgag.hardware_compiler as compilers
import pyfgag.dependency_builder as dep_builder


def entry_point():
    args = docopt.docopt(__doc__, version='build_fpga 1.0')


    compiler = compilers.QuartusCompiler(args["<board_name>"], args["<top_name>"])


    compiler.make_project()
    #compiler.build_bitstream()




if __name__ == '__main__':
    entry_point()
