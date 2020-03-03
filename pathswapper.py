

newShotNumber = ""
newVersion = ""
fullPath = ""
allReads = []
each = []

#Get path to new sequence
p = nuke.Panel('Pathswapper')
p.addFilenameSearch('Path to new seq', "choose seq")
p.addButton('Cancel')
p.addButton('Update all read nodes')
ret = p.show()

fullPath = str(p.value('Path to beauty')[:-10])
newShotNumber = str(fullPath.split('_sh')[2])[:4]
newVersion = str(fullPath.split('_v')[2])[:3]
print "Updating all read nodes to shot "+ str(newShotNumber) +" v"+ str(newVersion)

for a in nuke.allNodes():
    if 'FILEPATH_BG' in a['name'].value():
        print "Hello"

for a in nuke.allNodes():
    if 'Read' in a['name'].value():
        if 'Lighting' in a['file'].value():
            file = str(a.knob('file').getValue())
            oldShotNumber = str(file.split('_sh')[2])[:4] 
            oldVersion = str(file.split('_v')[2])[:3]
            file = file.replace(str(oldShotNumber), str(newShotNumber))
            file = file.replace(str(oldVersion), str(newVersion))
            #Apply paths
            newFile = a.knob('file').setValue(file)
            print str(file)

for a in nuke.allNodes():
    if 'FILEPATH_BG' in a['name'].value():
        print "FILEPATH_BG found"
        file = str(a.knob('label').getValue())
        print file
        oldShotNumber = str(file.split('_sh')[2])[:4] 
        oldVersion = str(file.split('_v')[1])[:3]
        file = file.replace(str(oldShotNumber), str(newShotNumber))
        file = file.replace(str(oldVersion), str(newVersion))
        #Apply paths
        newFile = a.knob('label').setValue(file)
        print str(file)

#To Do - put it all in a module with arguements instead of brute-forcing the nuke.allNodes() file / label split-position setup as above.

 

