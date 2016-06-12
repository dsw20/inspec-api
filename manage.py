#!/usr/bin/env python
import os
import sys


def clear_temps():
    sys.stderr.write('Removing *.pyc\n')
    os.system('find . -type f -name "*.pyc" -exec rm -rf "{}" \;')

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "configuration.settings")

    if (len(sys.argv) >= 2) and (sys.argv[1] == 'test'):
        clear_temps()

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
