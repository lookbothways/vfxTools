
import maya.cmds as cmds
import maya.mel as mel
import sys
import pymel.core
import os
import time 

#Add file path metaData
#Hide assistants
#Set project here
#hide all imagePlanes
#Sets up distortion ST maps connections



def addFilePathMetaData():
    
    # Adds metaData of saved name to the mayaFile metaData slot 
    
    
    nodeName = "defaultArnoldDriver.customAttributes"
    filePath = cmds.file(q=1,sn=1)
    mayaFile = {"type":"STRING","name":"mayaFile","value": filePath}
    
    
    def addAttribute(nodeName, value):
        #add an attribute
        nextIndex = 0
        if cmds.getAttr(nodeName, multiIndices= True):
            nextIndex = cmds.getAttr(nodeName, multiIndices= True)[-1] + 1
        cmds.setAttr(nodeName+'['+str(nextIndex)+']', "%s %s %s" % (value["type"],value["name"],value["value"]), type="string")
    
    def changeAttribute(nodename, value):
        for nodeNameIndex,i in enumerate(pymel.core.getAttr(nodeName)):
            j= i.split(" ")
            if len(j)>1:
                if j[1] == 'mayaFile':
                    cmds.setAttr(nodeName+'['+str(nodeNameIndex)+']', "%s %s %s" % (value["type"],value["name"],value["value"]), type="string")
                    break
    
    attributes=[]
    for i in pymel.core.getAttr(nodeName):
        j= i.split(" ")
        if len(j)>1:
            attributes.append( j[1])
        
        
    if "mayaFile" in attributes:
        metaDataAction = "mayaFile attribute existed, overwrote with new filename."
        #change the attribute
        changeAttribute(nodeName,mayaFile)
    
                
    else:
        #add an attribute
        metaDataAction = "mayaFile attribute did not exist. Added it for you."
        addAttribute(nodeName,mayaFile)
     
    print "Added metaData"
    #sys.stdout.write("metaData status: %s\n" %metaDataAction)


#Hide assistants


def hideAssistants():
    renderlayers = cmds.ls(type="renderLayer")
    print renderlayers
    
    if u'default_light_rig:defaultRenderLayer' in renderlayers:  
        renderlayers.remove(u'default_light_rig:defaultRenderLayer')
        print renderlayers
    
    for layer in renderlayers:
        print layer
        #select the render layer
        cmds.editRenderLayerGlobals(crl=layer)
        wordIn = "Assistants"
        sel = cmds.ls("*" + wordIn + "*", r=True)
        cmds.select(sel)
        cmds.hide(sel)
    print "Hid Assistants"


def setProjectHere():
    #set project here

    scene = cmds.file(q=1,sn=1)
    project = os.path.dirname(os.path.dirname(scene))
    mel.eval('setProject("%s")' % project)
    sys.stdout.write("Project location set: %s" %project)



def hideAllImageplanes():

    renderlayers = cmds.ls(type="renderLayer")
    print renderlayers
    
    if u'default_light_rig:defaultRenderLayer' in renderlayers:  
        renderlayers.remove(u'default_light_rig:defaultRenderLayer')
        print renderlayers
    
    for layer in renderlayers:
        cmds.editRenderLayerGlobals( currentRenderLayer=layer )
        cmds.hide(mel.eval('ls -typ "imagePlane"'))
       


def checkRenderCamera():

    # pick up here - check this is working
    myCameras=cmds.ls(typ='camera',l=True)
    renderableList=[]

    for x in myCameras:
        if cmds.getAttr(x+'.renderable'):
            renderableList.append(x)

    ll=len(renderableList)

    if ll==0 or ll>=2:
        print('Too many or no renderable cameras')
        return 0
    return 1




#-------------------------------------------------------------------------------


def executeThis():
    
    #checks to see if distortion file exists:
    distortionExists=True
    matching = []
        
    fileNodes=cmds.ls(typ='aiImage')
    matching = [s for s in fileNodes if "UV_lensDistortionMap" in s]
    
    if matching:
        print "Lens Distortion aiImage exists."
        distortionExists=False
    	
    
    
    #Creates a dialogue with checkboxes for the above defs
    

    if not checkRenderCamera():
        cmds.error('Please pick a camera to render')

    class createMyLayoutCls(object):
        def __init__(self, *args):
            pass

        def show(self):
            self.createMyLayout()

        def createMyLayout(self):

            #check to see if our window exists
            if cmds.window('utility', exists = True):
                cmds.deleteUI('utility')

            # create window
            self.window = cmds.window('utility', widthHeight = (200, 500), title = 'Pre-render checks', resizeToFitChildren=1, sizeable = False)

            cmds.setParent(menu=True)

            # create a main layout
            mainLayout = cmds.columnLayout(w = 200, h = 200, cw = 10, rs = 8, co = ['both',2])

            # Control - which things to do
            
            self.AFPMDbox = cmds.checkBox('Add file path MetaData', value=True)
            self.setProjectbox = cmds.checkBox('Set Project Here', value=True)
            self.hideImageplanebox = cmds.checkBox('Hide imageplanes', value=False)
            self.hideAssbox = cmds.checkBox('Hide Assistants', value=False)
            self.distortion = cmds.checkBox('Setup distortion', value=distortionExists)

            # Buttons that do things
            btnDoSelected = cmds.button(label = 'Do Selected', width = 200, height = 40, c = self.GetSelectedNodes)
            btnNoChanges = cmds.button(label = 'Make no changes', width = 200, height = 40, c = self.noChangesMade)
            
           
            # show window
            cmds.showWindow(self.window)

        def GetSelectedNodes(self,*args):
                
            hideAss = cmds.checkBox(self.hideAssbox,q = True, v = True)
            AFPMD = cmds.checkBox(self.AFPMDbox,q = True, v = True)
            setProject = cmds.checkBox(self.setProjectbox,q = True, v = True)
            hideImageplanes = cmds.checkBox(self.hideImageplanebox,q = True, v = True)
            distortion = cmds.checkBox(self.distortion,q = True, v = True)
            
            print hideAss
            if hideAss == True:
                hideAssistants()
                
            print AFPMD
            if AFPMD == True:
                addFilePathMetaData()
            

            print setProject
            if setProject == True:
                setProjectHere()

            print hideImageplanes
            if hideImageplanes == True:
                hideAllImageplanes() 
                
            print distortion
            if distortion == True:
                import setupMayaLensDistortionOptions
                reload(setupMayaLensDistortionOptions)
                setupMayaLensDistortionOptions.doSomething()

            if cmds.window('utility', exists = True):
                cmds.deleteUI('utility')
            
            
            mel.eval('SubmitJobToDeadline')
                
        def noChangesMade(self,*args):
            cmds.deleteUI('utility')
            
            mel.eval('SubmitJobToDeadline')
            print "No changes made, proceeding to Deadline Submission."

                

    b_cls = createMyLayoutCls()  
    b_cls.show()

