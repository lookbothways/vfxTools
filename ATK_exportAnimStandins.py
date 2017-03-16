import maya.cmds as cmds
import re
import os
import string
import pymel.core as pm
import arnold
import maya.mel as mel
import ftrack

"""Select geo to export and run this:

Improvements to make:
    
* Check that project is set to the same location as the file!!! (or standins get saved elsewhere)
* Get file-path, split and put /standin/directory there (in /animation/v001 etc)

"""

fileName=""


def setRendererArnold():

    # note - there needs to be a renderable camera defined in the globals or it fails.
    # If motion blur is not enabled and set at .ass export, the renders will not have motion blur. 

    pm.mel.setCurrentRenderer('arnold')
    cmds.setAttr('defaultArnoldRenderOptions.motion_blur_enable',1)

def removeCamera(refsList):

    for y in refsList:
        if re.search('camera',str.lower(str(y))):# change to lower case to avoid variations in camera spelling
            print('camera reference is '+y)
            path=cmds.referenceQuery(y,filename=True)
            cmds.file(path,rr=True)
    
    
def exportGeo():
    
    export_file=""
    
    #Import references
    
    refs = cmds.ls(type='reference', rf=True) #rf stops it from trying to import the sharedReferenceNode, which can't be imported.
    for i in refs:
        rFile = cmds.referenceQuery(i, f=True)
        cmds.file(rFile, importReference=True)
        referenceFiles=cmds.ls( references=True)
        print referenceFiles
        
    
    #Remove namespaces
    nameSpacedGeo=cmds.namespaceInfo(listOnlyNamespaces=True)
    nameSpacedGeo=[n for n in nameSpacedGeo if n not in [u'MergeWithFlagTempNamespaceName', u'UI', u'shared']]
    
    for ns in nameSpacedGeo:
        cmds.namespace(removeNamespace=ns,mergeNamespaceWithRoot=True)
       

    #gets the frame range
    
    taskId = os.getenv('FTRACK_TASKID')
    task = ftrack.Task(taskId)
    shot = task.getParent()
    seq =shot.getParent()
    show = seq.getParent()
        
        
    print "Current shot: " +show.get("name")+"_"+seq.get("name")+"_"+shot.get("name")
    shotName = show.get("name")+"_"+seq.get("name")+"_"+shot.get("name")
    print "Frame range : %s-%s"%(shot.get("fstart"),shot.get("fend"))
    print "Exporting file {}".format(export_file)
    fStart = shot.get("fstart")
    fEnd = shot.get("fend")
    
    #Makes the export path
    proj=cmds.workspace(q=True,act=True)
    export_file=(proj+"/standin/"+fileName+".ass")
    print export_file
    
    #Select originally selected geo. Uses MEL because python complains if the nodes have the same names (ie 'tentacle')
    mel.eval("select -r selectedGeo ;")
    
    #Exports Arnold sequence of selected geo
    #mask=253 should export all the things
    cmds.arnoldExportAss(f=export_file,fsh=True,s=True,startFrame=fStart,endFrame=fEnd,frameStep=1,mask=253,lightLinks=0,shadowLinks=0,selected=True,boundingBox=True)
    
    #Cleans up selection set
    cmds.delete("selectedGeo")
    print "Exported seq: {} from {}-{}".format(export_file, fStart, fEnd)
    
    #--------------

def doSomething():
    # Preps the geo for export

    objectsToExport=[]
    objectsToExport=cmds.ls( selection=True )
    selected = cmds.sets(n="selectedGeo")


    #dialogue for file export name

    if objectsToExport:
        result = cmds.promptDialog(
                title='.ass export',
                message='Enter .ass seq filename:',
                button=['OK', 'Cancel'],
                defaultButton='OK',
                cancelButton='Cancel',
                dismissString='Cancel')
        
        if result == 'OK':
            #Removes the camera (so imagePlanes etc don't get exported with any .ass files accidentally)
            refsList=cmds.ls(type='reference')
            removeCamera(refsList)

            setRendererArnold()
            global fileName
            fileName = cmds.promptDialog(query=True, text=True)
            exportGeo()

            
        print fileName
        
    else:
        cmds.delete("selectedGeo")
        cmds.error( "Nothing is selected! Select geo to export as .ass" )
        

        
 
