def setGeo():

	import maya.mel as mel
	import maya.cmds as cmds

	#makes Scengeo the source mesh for the shadowCatcher

	sceneGeo = cmds.ls( selection=True )
	print sceneGeo

	#Freeze transformations
	cmds.makeIdentity(apply=True, t=1, r=1, s=1, n=0)

	#Merges objects if more than one object to catch shadows
	if len(sceneGeo) > 1:  
		
		for obj in sceneGeo:
		    noUnicode = unicode(obj)
		    newObjName = noUnicode+"_mergedForShadowCatcher"
		    print newObjName

		print "More than one object. Merging objects"
		cmds.select(sceneGeo)
		hideMe = cmds.polyUnite(sceneGeo, n=newObjName )
		cmds.hide( hideMe[0] )
		sillyString = "connectAttr -f {}Shape.outMesh shadowCatcherShape.inMesh;".format(newObjName)
		#Hide the original geo in all layers
		
		renderlayers = cmds.ls(type="renderLayer")
		print renderlayers
		
		if u'default_light_rig:defaultRenderLayer' in renderlayers:  
		    renderlayers.remove(u'default_light_rig:defaultRenderLayer')
		    print renderlayers
		
		for layer in renderlayers:
		    cmds.editRenderLayerGlobals( currentRenderLayer=layer )
		    cmds.hide( newObjName )  


	#otherwise do just the one
	else:
		print "Only one object selected"
		
		noUnicode = cmds.pickWalk(d='Down')
		noUnicode=str(noUnicode[0])
		    
		sillyString = "connectAttr -f {}.outMesh shadowCatcherShape.inMesh;".format(noUnicode)
		#Hide the original geo in all layers
		
		renderlayers = cmds.ls(type="renderLayer")
		print renderlayers
		
		if u'default_light_rig:defaultRenderLayer' in renderlayers:  
		    renderlayers.remove(u'default_light_rig:defaultRenderLayer')
		    print renderlayers
		
		for layer in renderlayers:
		    cmds.editRenderLayerGlobals( currentRenderLayer=layer )
		    cmds.hide( sceneGeo )
		
		
	print sillyString
	mel.eval(sillyString)


