from distutils.cmd import Command

import glob
import setuptools
import sys

NAME = 'pyfgag'
URL = 'https://github.com/FAIG2014/fpga-projects'
DESCRIPTION = 'Python stuff'
AUTHOR = 'Francis Gagnaire'
AUTHOR_EMAIL = ''
MAJOR_BUILD = '0'
MINOR_BUILD = '1'

REQUIREMENTS = [
    'docopt',
]
TEST_REQUIREMENTS = REQUIREMENTS + [
]






def get_version():
    """ Calculate the build number """
    return "%s.%s" % (MAJOR_BUILD, MINOR_BUILD)



setuptools.setup(

    name=NAME,
    url=URL,
    version=get_version(),
    description=DESCRIPTION,
    long_description=DESCRIPTION,

    # maintainer details
    author=AUTHOR,
    author_email=AUTHOR_EMAIL,

    # packages to install
    packages=setuptools.find_packages(exclude=[]),

    # include structure.xml
    # should we use MANIFEST.in??
    package_data={},

    # automatically include all python files in scripts as scripts
    scripts=[],

    # autogather tests with nose
    test_suite='nose.collector',

    # don't use compressed eggs
    zip_safe=False,

    # specify requirements
    install_requires=REQUIREMENTS,
    tests_require=TEST_REQUIREMENTS,


    entry_points={
        'console_scripts': [
                'create_sv_test = pyfgag.create_sv_test:entry_point',
                'run_sv_test    = pyfgag.run_sv_test:entry_point',
                'build_fpga     = pyfgag.build_fpga:entry_point',

        ]
    }


)