#!/usr/bin/python3
"""
run run_sv_test

Usage:
    run_sv_test [<file_name>] 

Options:
    <file_name>           filter to run only a subset of our test files
"""

import os
import sys
import argparse
import docopt
import pyfgag.simu_compiler as compilers
import pyfgag.dependency_builder as dep_builder


def find_sv_unit_tests():
    files = []
    current_folder = os.getcwd()
    # Parse the current folder
    for _file in os.listdir(os.getcwd()):
        # Check only the files
        if os.path.isfile(_file):
            # Ensure its at least a verilog file
            if _file.endswith("unit_test.sv") or _file.endswith("unit_test.v"):
                files.append(os.path.join(current_folder, _file))
    return files


def find_verilator_unit_tests():
    files = []
    current_folder = os.getcwd()
    # Parse the current folder
    for _file in os.listdir(os.getcwd()):
        # Check only the files
        if os.path.isfile(_file):
            # Ensure its at least a verilog file
            if _file.endswith("main.cpp"):
                files.append(os.path.join(current_folder, _file))
    return files


def get_build_path_for_pwd():
    relative = os.getcwd().split("fpga-projects/fpga/")[1]
    return os.path.join(dep_builder.get_build_path(os.getcwd()), relative)

def entry_point():
    docopt.docopt(__doc__, version='run_sv_test 1.0')


    build_dir   = get_build_path_for_pwd()
    tests_sv    = find_sv_unit_tests()
    tests_cpp   = find_verilator_unit_tests()
    simulator   = "vivado"

    for test in tests_sv:

        if "iverilog" in simulator or "icarus" in simulator:
            compiler = compilers.CompilerIverilog()

        elif "verilator" in simulator:
            continue

        elif "modelsim" in simulator:
            compiler = compilers.CompilerModelsim()

        elif "vivado" in simulator:
            compiler = compilers.CompilerVivado(build_dir=build_dir)

            

        compiler.compile(test)
        compiler.run_simu(test)

    for test in tests_cpp:

        if "verilator" in simulator:
            compiler = compilers.CompilerVerilator()
        else:
            compiler = compilers.CompilerVerilator()

        compiler.compile(test)
        compiler.run_simu(test)


if __name__ == '__main__':
    entry_point()
