import maya.cmds as cmds

"""
For shelf: 

from convertBackplates import chooseFormat
reload(chooseFormat)
chooseFormat.chooseFormat()

"""


def chooseFormat():

            
    chooseNode = cmds.confirmDialog( title='Convert DPX backplates to:', message='Choose format', button=['Jpg','Png','Exr','Cancel'], defaultButton='Exr', cancelButton='Cancel', dismissString='No' )       

    if chooseNode == 'Jpg':
        from convertBackplates import convertBackplatesJpg
        reload(convertBackplatesJpg)
        convertBackplatesJpg.convertBackplates()

    if chooseNode == 'Png':
        from convertBackplates import convertBackplatesPng
        reload(convertBackplatesPng)
        convertBackplatesPng.convertBackplates()
        
    if chooseNode == 'Exr':
        from convertBackplates import convertBackplatesExr
        reload(convertBackplatesExr)
        convertBackplatesExr.convertBackplates()


"""
#Example exporter

import os.path
import glob
import maya.cmds as cmds
import os
import maya.mel as mel
import sys
import subprocess

#Gets the start and end frames of a sequence (thanks Will!)
def dpxSeq():
    filePath = cmds.fileDialog(title="Convert PULL DPX > EXR")
    filename, file_extension = os.path.splitext(filePath)
    file_list = glob.glob(filename[:-4] + "*" + file_extension) # create filtered list of files
    
    frames = [f[-8:-4] for f in file_list]
    print min(frames), max(frames)
    
    #makes a "/linear" directory
    withHash = (filename[:-4] + "####" + file_extension)
    folderPath, fullFilename = os.path.split(withHash)
    linearPath = folderPath+"/linear/"
    exportPath = linearPath+fullFilename
    exportFilename = (exportPath[:-4]+".exr")
    print exportFilename
    
    if not os.path.isdir( folderPath ):
        os.makedir( folderPath )
        print "Created dir " + folderPath
    
    #The command for a shell:
    sillyString = "/mnt/pipeline/software/Nuke9.0v4/Nuke9.0 -x /mnt/resources/nuke/lightingBackplates/lightingBackplates_v004.nk {} {} {}-{}".format(withHash, exportFilename, min(frames), max(frames))
    print sillyString

    return sillyString

def convertBackplates():
    subprocess.Popen(dpxSeq(), shell=True)
    
    
    
"""   
#end
