#!/bin/sh

# i3bar needs JSON to display conky output,
# doublequotes in the title screw with the JSON formatting

conky -t '$mpd_artist - $mpd_title' | \

# get second line of conky's output (first seems to always be null - null)
sed -n '2,${p;q;}' | \

# # replace doublequotes with spaces
sed -u 's/\"/ /g'
