#!/usr/bin/python3
"""
run create_sv_test

Usage:
    create_sv_test <file_name> 

Options:
    <file_name>           file name of the module we want to create a test for
"""

import os
import sys
import docopt




def create_sv_test(file_name):


    base_file_name = os.path.basename(file_name)
    instance_name =  "%s_unit_test" % base_file_name 
    test_file_name = "%s.sv" % instance_name 
    
    with open(test_file_name, "w") as test_file:
        test_file.write("""`include "svut_h.sv"\n\n""")
        

        test_file.write("""`timescale 1 ns / 1 ps\n""")
        test_file.write("""\n""")
        test_file.write("""module """ + instance_name + ";\n")
        test_file.write("""\n""")
        test_file.write("""    `SVUT_SETUP\n""")
        test_file.write("""\n""")
        test_file.write("""    );\n""")
        test_file.write("""\n""")
        test_file.write("""    // An example to create a clock\n""")
        test_file.write("""    // initial aclk = 0;\n""")
        test_file.write("""    // always #2 aclk <= ~aclk;\n""")
        test_file.write("""\n""")
        test_file.write("""    task setup();\n""")
        test_file.write("""    begin\n""")
        test_file.write("""        // setup() runs when a test begins\n""")
        test_file.write("""    end\n""")
        test_file.write("""    endtask\n""")
        test_file.write("""\n""")
        test_file.write("""    task teardown();\n""")
        test_file.write("""    begin\n""")
        test_file.write("""        // teardown() runs when a test ends\n""")
        test_file.write("""    end\n""")
        test_file.write("""    endtask\n""")
        test_file.write("""\n""")
        test_file.write("""    `UNIT_TESTS\n\n""")
        test_file.write("""    `UNIT_TEST(TESTNAME)\n""")
        test_file.write("""\n""")
        test_file.write("""        `INFO("Start TESTNAME");\n""")
        test_file.write("""\n""")
        test_file.write("""        // Describe here the testcase scenario\n""")
        test_file.write("""\n""")
        test_file.write("""        `INFO("Test finished");\n""")
        test_file.write("""\n""")
        test_file.write("""    `UNIT_TEST_END\n""")
        test_file.write("""\n""")
        test_file.write("""    `UNIT_TESTS_END\n""")
        test_file.write("""\n""")
        test_file.write("""endmodule\n""")
        test_file.write("""\n""")


def entry_point():
    args = docopt.docopt(__doc__, version='create_sv_test 1.0')

    file_name = args["<file_name>"]

    create_sv_test(file_name=file_name)


if __name__ == '__main__':
    entry_point()