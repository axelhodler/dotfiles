#!/usr/bin/python
import time, os

FILENAME = 'hilight'

filestats = os.stat(FILENAME)

# flush file with hilight and older than 1 minute
if not filestats.st_size == 0 and (time.time() - filestats.st_mtime) >= 120:
    f = open(FILENAME, 'w')
    f.flush();
    f.close();
