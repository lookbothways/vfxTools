import maya.cmds as cmds
import re
import string
import maya.mel as mel
import os

exists=False


def stMapPath(proj):

    #Gets the correct filename
    temp=string.split(proj,'/')
    seq="sc"+temp[6]
    shot="sh"+temp[7]
    
    pubDir=('/mnt/projects/tt/publish/scenes/'+seq+'/'+shot+'/distortion/')
    
    
    distortion=[]
    distortion=str(cmds.getFileList(fld=pubDir,fs='*distorted.exr'))
    distortion=distortion[3:-2]
    print "Looking for {}".format(distortion)
    
    dirList=str(pubDir)+str(distortion)
    fileExists=os.path.exists(dirList)
                
    if fileExists == True:
        
        mapPath=dirList
        print "File exists: {} ".format(dirList)
        return mapPath
        exists=True

    else:
        return   



def getRes(camera):

	# example name sh110_RENDERCAMERA_2128x1197Shape

	myLen=len(camera);
	print(myLen)

	xres=camera[myLen-14:myLen-10]
	yres=camera[myLen-9:myLen-5]

	return [xres,yres]

def getCamera():

	cameras=cmds.ls(typ='camera')

	for x in cameras:
		if re.search('rendercamera',x.lower()):
			return x
			break

def setResolution(camera,option):

	res=[2048,1152]

	if option=='overscan':
		res=getRes(camera)
		print('xres is '+res[0]+' yres is '+res[1])

	if cmds.objExists('defaultResolution'):

		cmds.setAttr('defaultResolution.width',float(res[0]))
		cmds.setAttr('defaultResolution.height',float(res[1]))

def getOption():

	option=cmds.confirmDialog( 
		title='Distortion Pipeline Options',
		message='Choose Lens Options',
		button=['Use ST Map','Use Overscan','Bypass','Cancel'],
		defaultButton='Use ST Map',
		cancelButton='Cancel',
		dismissString='Cancel'
		)

	return option

def mkFileNode(myName):
	return cmds.createNode('aiImage',name=myName)

def assignMap(node,path):
    
    if re.search(".exr",path):
        print "Connecting ST file: "+path
    else:
        cmds.warning( "Distortion setup failed: ST map is not in the correct location / incorrectly named." )

    cmds.setAttr(node+'.filename',path,type='string')
    
    
    cmds.setAttr(node+'.swrap',2) # clamp texture tiling - IMPORTANT
    cmds.setAttr(node+'.twrap',2)
	

def checkForExistingFileNode(myMap):

	fileNodes=cmds.ls(typ='aiImage')
	for x in fileNodes:
		test=cmds.getAttr(x+'.filename')
		if re.search(myMap,test):
			return x
	return None

def makeUVMapConnection(camera,myMap):

	test=checkForExistingFileNode(myMap)
	if test is not None:
		print('reconnecting existing aiImage node')
		txFileNode=test
	else:
		txFileNode=mkFileNode('UV_lensDstortionMap')
		print('made aiImage node '+txFileNode)

	assignMap(txFileNode,myMap)
	cmds.connectAttr(txFileNode+'.outColor',camera+'.aiUvRemap')


def connectUVMap(proj,camera):

    uvMap=stMapPath(proj)
    if stMapPath(proj):
       print "Attempting to connect {}".format(stMapPath(proj))
       
    if uvMap is not None:
    	#print(uvMap)
    	if not breakConnection(camera,'test'): # test for existing connection
    		makeUVMapConnection(camera,uvMap)
    	else:
    		cmds.warning( "There is already a map connected to aiUvRemap." )
    else:
    	cmds.warning( "Map not found!" )
		
def breakConnection(camera,mode):
	conn=cmds.listConnections(camera+'.aiUvRemap',d=False,s=True,p=True) 
	if conn is not None:
		if mode=='break':
    			cmds.disconnectAttr(conn[0],camera+'.aiUvRemap')
		if mode=='test':
			return 1

def doSomething():

	option=getOption()
	#print('option was '+option)

	if option=='Cancel':
		return

	proj=cmds.workspace(q=True,act=True)
	camera=getCamera()

	if option=='Use ST Map':
		connectUVMap(proj,camera)
		setResolution(camera,'default')

	if option=='Use Overscan':
		breakConnection(camera,'break')
		setResolution(camera,'overscan')

	if option=='Bypass':
		breakConnection(camera,'break')
		setResolution(camera,'default')


doSomething()
