# setRange
# fTrack tool
# Add this to your shelf:
"""
import setRange
reload(setRange)
setRange.setTimeline()
"""

#gets the frame range
import ftrack
import os
import maya.cmds as cmds
import re
import string

def setTimeline():
    taskId = os.getenv('FTRACK_TASKID')
    task = ftrack.Task(taskId)
    shot = task.getParent()
    seq =shot.getParent()
    show = seq.getParent()
    
    
    print "Current shot: " +show.get("name")+"_"+seq.get("name")+"_"+shot.get("name")
    print "Frame range : %s-%s"%(shot.get("fstart"),shot.get("fend"))
    fStart = shot.get("fstart")
    fEnd = shot.get("fend")

    cmds.playbackOptions(min=int(fStart),max=int(fEnd))
    cmds.setAttr('defaultRenderGlobals.startFrame',int(fStart))
    cmds.setAttr('defaultRenderGlobals.endFrame',int(fEnd))
    print "Set timeline and frame range to {}-{}".format(fStart,fEnd)

