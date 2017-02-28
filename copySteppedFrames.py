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
	message="Copy stepped frame range: {} - {} ?\n\nFirst frame, last frame, every tenth frame, remaining frames. \n\n{}\n\nStart frame {} ftrack. \nEnd frame {} ftrack".format(fStart, fEnd, alert, matchStart, matchEnd),
	button=['Copy','Cancel'],
	defaultButton='Copy',
	cancelButton='Cancel',
	dismissString='Cancel'
	)
	
if option == 'Copy':

    
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
        
else:
    print "Range not copied."



