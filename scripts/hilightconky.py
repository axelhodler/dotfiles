#!/usr/bin/python
import sys, re

# format the string
match = re.search(r'<(.+)>', sys.argv[1])
user = match.group(1)

# write the hilight to file
f = open('hilight', 'w')
f.write(">>> " + chan + " <<<\n")
f.close()
