

import maya.cmds as cmds
import arnold
import pymel.core as pymel
import maya.mel as mel

#Makes group of selected nodes and renames it to the parent group name +_standin


print "Exporting selected objects as .ass"


"""
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
"""


mask = arnold.AI_NODE_OPTIONS | arnold.AI_NODE_LIGHT | arnold.AI_NODE_SHAPE | arnold.AI_NODE_OVERRIDE | arnold.AI_NODE_FILTER
print mask


selected = cmds.ls(sl=True)
cmds.pickWalk (d='Up')
groupName = str(cmds.ls( selection=True ))

#removes unicode chars and sets up groupname
noUnicode = groupName[3:-2]   
groupname = (noUnicode+"_swapOut")
#cmds.group( selected, n=groupname )

cmds.select( selected )
mel.eval('doGroup 0 1 1;') 
cmds.rename( groupname )



#Sets the name of the ass file and path and exports the .ass
#Change this path!
export_dir = "/mnt/projects/revolt/publish/assets/character/spider/standins/spiderSwapOutStandins/"
export_file = export_dir+groupname+'.ass'

output = cmds.arnoldExportAss( f=export_file, fsh=True, mask=173, lightLinks=0, shadowLinks=0, selected=True)


#imports .ass container and fills it with export_file path

cmds.file( export_file, i=True )
cmds.setAttr( "ArnoldStandInShape.deferStandinLoad", 0)
imported = cmds.ls( 'ArnoldStandIn*', sl=False )

#selects and renames the standin
swapOutName = ( groupname+"_standIn" )
cmds.rename( imported[0], swapOutName)
cmds.select( groupname, swapOutName )


#modify > replace geo with standin
cmds.ReplaceObjects()
#cmds.delete( swapOutName )
    
print "swapOut: Swapped out selected geo for standIn."
