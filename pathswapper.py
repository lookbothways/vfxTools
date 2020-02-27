#Nuke tool to swap shot name and version for another
import re

print "Pathswapper"
#Get path to new sequence
p = nuke.Panel('Pathswapper')
p.addFilenameSearch('Path to beauty', "//islay/projects/shangrila/publish/episodes/")
p.addButton('Cancel')
p.addButton('Update all read nodes')
ret = p.show()



if 'beauty' in fullPath:
    fullPath = p.value('Path to beauty')[:-10]
    #print fullPath

    shotNumber = fullPath.split('_sh')[4]
    print shotNumber



else:
    print "File format error please choose a beauty render"


