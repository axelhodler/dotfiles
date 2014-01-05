#!/usr/bin/python
import sys, re

FILENAME = '/home/xorrr/dotfiles/scripts/hilight'

# format the string
match = re.search(r'<(.+)>', sys.argv[1])
user = match.group(1)

# write the hilight to file
f = open(FILENAME, 'w')
f.write(user)
f.close()
