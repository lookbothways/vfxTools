import maya.cmds as cmds
import os.path
import glob
import os
import sys
import subprocess

fileFormat = ""
def start():
    
    def convertPrep(fileFormat):
        filePath = cmds.fileDialog(title="Convert DPX To {}".format(str.upper(fileFormat)))
        filename, file_extension = os.path.splitext(filePath)
        file_list = glob.glob(filename[:-4] + "*" + file_extension) # create filtered list of files
        frames = [f[-8:-4] for f in file_list]
        print min(frames), max(frames)
        withHash = (filename[:-4] + "####" + file_extension)
        folderPath, fullFilename = os.path.split(withHash)
        linearPath = folderPath+"/"+fileFormat+"/"
        exportPath = linearPath+fullFilename
        exportFilename = (exportPath[:-4]+"."+str.lower(fileFormat))
        print exportFilename
        if not os.path.isdir( linearPath ):
            os.mkdir( linearPath )
            print "Created dir "+linearPath
        else:
            print "Path exists :"+linearPath
        #The command for a shell:
        sillyString = "sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/lightingBackplates/lightingBackplates{}_v001.nk '{}' '{}' -F {}-{}".format(fileFormat, withHash, exportFilename, str(min(frames)), str(max(frames)))
        print sillyString
        return sillyString
    chooseNode = cmds.confirmDialog( title='Convert DPX backplates', message='Choose format:', button=['Jpg','Png','Exr','Cancel'], defaultButton='Exr', cancelButton='Cancel', dismissString='No' )   
        
    if chooseNode is not 'Cancel':
        if chooseNode == 'Jpg':
            fileFormat = "Jpg" 
            convertPrep(fileFormat)
            subprocess.Popen(sillyString, shell=True)
            print "\nConverting to .jpg",
        if chooseNode == 'Png':
            fileFormat = "Png"
            convertPrep(fileFormat)
            subprocess.Popen(sillyString, shell=True)
            print "\nConverting to .png",             
        if chooseNode == 'Exr':
            fileFormat = "Exr"
            sillyString = convertPrep(fileFormat)
            subprocess.Popen(sillyString, shell=True)
            print "\nConverting to .exr",
            
#End MSB200319
