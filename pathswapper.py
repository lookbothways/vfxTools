#Nuke tool to swap shot name and version for another
#https://note.nkmk.me/en/python-str-replace-translate-re-sub/
#note this code is WIP and specific to a project

import re

print "Pathswapper"
#Get path to new sequence
p = nuke.Panel('Pathswapper')
p.addFilenameSearch('Path to beauty', "//islay/projects/shangrila/publish/episodes/")
p.addButton('Cancel')
p.addButton('Update all read nodes')
ret = p.show()
#test
fullPath = ["things/thing/1030thingy/1030/thingles1030_v001.%20d.exr","things/thing/1030thingy/1030/thingles1030_v001.%20d.exr","things/thing/1030thingy/1030/thingles1030_v001.%20d.exr","things/thing/1030thingy/1030/thingles1030_v001.%20d.exr","things/thing/1030thingy/1030/thingles1030_v001.%20d.exr"]


if 'exr' in fullPath:
    fullPath = p.value('Path to beauty')[:-10]
    #print fullPath

 
    oldShotNumber = "1030"
    newShotNumber = "1160"
    oldVersion = "001"
    newVersion = "012"

    for each in fullPath:
        each = each.replace(str(oldShotNumber), str(newShotNumber))
        each = each.replace(str(oldVersion), str(newVersion))
        print(each)
        #nuke.set knob value here


else:
    print "File format error please choose an exr to switch paths to"


