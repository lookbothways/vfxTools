# export .obj seq

import maya.cmds as cmds
import random
import time
from LONshelf import breakLoop

"""
#frame advance by step

step = 1
timeNow = cmds.currentTime( query=True )
print timeNow
nextStep = timeNow+step
cmds.currentTime( nextStep, update=True, edit=True )
timeNow = cmds.currentTime( query=True )

Get the correct mask value using these constants:
    AI_NODE_UNDEFINED   0x0000
    AI_NODE_OPTIONS     0x0001
    AI_NODE_CAMERA      0x0002
    AI_NODE_LIGHT       0x0004
    AI_NODE_SHAPE       0x0008
    AI_NODE_SHADER      0x0010
    AI_NODE_OVERRIDE    0x0020
    AI_NODE_DRIVER      0x0040
    AI_NODE_FILTER      0x0080
    AI_NODE_ALL         0xFFFF
mask = arnold.AI_NODE_OPTIONS | arnold.AI_NODE_LIGHT | arnold.AI_NODE_SHAPE | arnold.AI_NODE_OVERRIDE | arnold.AI_NODE_FILTER
print mask
mask=173 mesh no shaders, but tse on.
mask=253 export all the things


"""
# The thing to export
selected = cmds.ls(sl=True)

# create breakLoop file
breakLoop.breakLoopSetup() 




# Export to where?
export_dir = str(cmds.fileDialog2(fm=3, dialogStyle=2, cap='Select output location', okCaption='Save here'))
dir = export_dir.split("'")[1]+"/" #Alternative noUnicode and added slash

step = 2


while cmds.currentTime( query=True ) < 10:
    if not breakLoop.breakLoop():
        print "breakLoop file found, continuing : /tmp/deleteMeToStop"
        
        frameNow = str(round(cmds.currentTime( query=True )))[0:-2]
       
        # CHANGE THIS to groupname
        name = "MASH1_ReproMesh1_"+frameNow
       
        timeNow = cmds.currentTime( query=True )
        print timeNow
        nextStep = timeNow+step
        cmds.currentTime( nextStep, update=True, edit=True )
        timeNow = cmds.currentTime( query=True )
       
        # export to this directory:
       
        #Makes the export path
        fileFormat = "obj"
        export_file = "{}{}.{}".format(dir,name,fileFormat)
        
    
        print "Exporting "+export_file 
    
        cmds.select( selected ) 
        # standins: 
        # cmds.arnoldExportAss(f=export_file,fsh=True,s=True,frameStep=1,mask=253,lightLinks=0,shadowLinks=0,selected=True,boundingBox=True)
        # obj version
        cmds.file(export_file,pr=1,typ="OBJexport",es=1,op="groups=0; ptgroups=0; materials=0; smoothing=0; normals=0")      
          
    else:
        print "deleteMeToStop not found. Ending loop."   


#end
