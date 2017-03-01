# Gets the frame range and creates a string of first frame, last frame and every 10th frame in between

import ftrack
import os
import maya.cmds as cmds
import re
import string

fStart = int(cmds.getAttr('defaultRenderGlobals.startFrame'))
fEnd = int(cmds.getAttr('defaultRenderGlobals.endFrame'))

# fTrack range
    
taskId = os.getenv('FTRACK_TASKID')
task = ftrack.Task(taskId)
shot = task.getParent()
seq =shot.getParent()
show = seq.getParent()


print "Current shot: " +show.get("name")+"_"+seq.get("name")+"_"+shot.get("name")
print "Frame range : %s-%s"%(shot.get("fstart"),shot.get("fend"))
fTStart = shot.get("fstart")
fTEnd = shot.get("fend")

matchStart = ""
matchEnd = ""
alert = ""

if fTStart == fStart:
    matchStart = "matches"
    print "Start frame matches fTrack"
else:
    matchStart = "does not match"
    alert = "WARNING!"

if fTEnd == fEnd:
    matchEnd = "matches"
    print "End frame matches fTrack"
else:
    matchEnd = "does not match"
    alert = "WARNING!"


option=cmds.confirmDialog( 
	title='frameSteps to copyBuffer',
	message="Create stepped frame range list: {} - {} ?\n{}\n\nStart frame {} ftrack. \nEnd frame {} ftrack".format(fStart, fEnd, alert, matchStart, matchEnd),
	button=['Tenths','Fill gaps','Cancel'],
	defaultButton='Copy',
	cancelButton='Cancel',
	dismissString='Cancel'
	)
	
	

if option == 'Tenths':

    
    # Create stepped string

    renderOrder = [fStart,fEnd]
    renderme= set(range(fStart,fEnd+1))
    renderTenths=range(fStart, fEnd, 10)
    renderOrder+= renderTenths[1:]
    rest=list(renderme-set(renderOrder))
    renderOrder+=sorted(rest)
    
    frameSplit = ",".join([str(i) for i in renderOrder])
    
    # puts frameSplit in the copybuffer
    
    from PySide import QtGui
    clipboard= QtGui.QApplication.clipboard()
    clipboard.setText(frameSplit) # set clipboard
    print "Range copied: {}".format(clipboard.text()) 
    

if option == 'Fill gaps': 
    
    # Evenly Distributed frames
    
    framelist= [fStart, fEnd]
    gaps= True #go into loop
    while gaps:
        a= list(sorted(framelist))
        print "sorted framelist", a
        gaps= [x+ (y- x)// 2 for x, y in zip(list(a)[:-1], list(a)[1:]) if x+ (y- x)// 2 not in a]
        print "gaps", gaps
        framelist+= gaps
                
    frameSplit = "".join(str(framelist))
        
    
    # puts frameSplit in the copybuffer
    
    from PySide import QtGui
    clipboard= QtGui.QApplication.clipboard()
    clipboard.setText(frameSplit) # set clipboard
    print "Range copied: {}".format(clipboard.text()) 



