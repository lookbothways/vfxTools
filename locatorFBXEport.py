def exportlocs():

	import maya.cmds as cmds
	import sys
	import os
	import maya.mel as mel


	cams = cmds.ls(sl=True)
	print cams


	newcams = []

	for cam in cams:
	# duplicate camera
		newcam = cmds.duplicate(cam, rr=True)
		if (cmds.listRelatives(newcam, p=True) != None):
			cmds.parent(newcam, world=True)

		# constrain to selected cam
		constraint = cmds.parentConstraint(cam, newcam)

		# bake duplicate
		s = cmds.playbackOptions(q=1, min=1)
		e = cmds.playbackOptions(q=1, max=1)
		cmds.bakeResults(newcam, s=True,t=(s,e))

		cmds.delete(constraint)
		newcams.append(' '.join(newcam[:]))
	
	print newcams
	cmds.select(newcams)

	#set filename
	filePath = cmds.fileDialog2( fm=0, cap="Export Locators", ds=2, fileFilter="FBX (*.fbx)" )
	fpath = str(filePath[0])

	if not fpath.endswith(".fbx"):
		fpath = fpath + ".fbx"

	# fbx export
	cmds.select(newcams)

	mel.eval('FBXExport -f "%s" -s -v FBX201200 ;' %fpath)

	# remove duplicate
	for newcam in newcams:
		cmds.delete(newcam)

