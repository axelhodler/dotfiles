#!/usr/bin/python
import sys, re

# format the string
match = re.search(r'<(.+)>', sys.argv[1])
user = match.group(1)

# write the hilight to file
f = open('/home/xorrr/dotfiles/scripts/hilight', 'w')
f.write(user + " @IRC\n")
f.close()
