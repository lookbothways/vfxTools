# Send path to denoice via Deadline

import maya.cmds as cmds
import re

fileFormat = ""
filename_input = cmds.fileDialog(title="Choose a beauty frame to denoise via Deadline {}".format(str.upper(fileFormat)))

# Match group 1 (everything up to the dot) with \d+ (any number) and append group 2 (everything from the next dot to the end):
matchstring= r"(.+\.)\d+(\.+)"
# will swap any occurance of numbers between dots (ie .1001.) for %04d - ie as if it had four numerals, regardless of how many are found. 
# Improvement could be to get the number of digits found and swap 4 for that number. 
filename_input =  re.sub(matchstring, "\g<1>%04d\g<2>", filename_input)



