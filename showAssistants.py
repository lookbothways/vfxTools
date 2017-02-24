def showHide():
	import pymel.core
	import maya.cmds as cmds
	#shows the lightRigAssistant chromeBall and greyBall group (anything with Assistants)


	wordIn = "Assistants"
	sel = cmds.ls("*" + wordIn + "*", r=True)
	cmds.select(sel)
	print sel

		
	pymel.core.showHidden(sel)
