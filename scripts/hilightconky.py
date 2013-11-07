#!/usr/bin/python
import sys, re

# format the string
match = re.search(r'\s(#\w+)', sys.argv[1])
chan = match.group(1)

# write the hilight to file
f = open('hilight', 'w')
f.write(">>> " + chan + " <<<\n")
f.close()
