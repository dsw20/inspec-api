# -*- coding: utf-8 -*-

from django.test import SimpleTestCase
from sys import stderr

TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'

NOSE_ARGS = [
    '--with-coverage',
    '--cover-package=api,importer',
    '--cover-erase',
    '--exe',
    '--with-doctest',
    '--all-modules',
    '--logging-clear-handlers',
    '-d',  # Add detail to error output
    # '--cover-html',
    # '-s',  # print stdout
    '--cover-tests',  # test tests
    '--nologcapture',
    '--verbosity=2',
]
