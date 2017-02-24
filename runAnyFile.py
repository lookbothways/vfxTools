#bakes and exports a locator (or object selected)

#Run any python file
import maya.cmds as cmds
import sys
import os

def psource(module):
    
    file = os.path.basename( module )
    dir = os.path.dirname( module )
    
    toks = file.split( '.' )
    modname = toks[0]
    
    if( os.path.exists( dir ) ):
        paths = sys.path
        pathfound = 0
        for path in paths:
            if(dir == path):
                pathfound = 1
        
        if pathfound == 0:
            sys.path.append( dir )
    
    exec ('import ' + modname) in globals()
    exec( 'reload( ' + modname + ' )' ) in globals()
    return modname

psource("/mnt/projects/revolt/publish/scripts/pipelineShelf/locatorFBXExport.py")
