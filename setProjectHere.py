import maya.cmds as cmds
import maya.mel as mel
import os
import sys

#set project here

def setProjectHere():

	scene = cmds.file(q=1,sn=1)
	project = os.path.dirname(os.path.dirname(scene))
	mel.eval('setProject("%s")' % project)


	sys.stdout.write("Project location set: %s" %project)
