
"""from playblastLensDistortion import addLensDistortion
reload(addLensDistortion)

addLensDistortion.playblast()

"""
import os.path
import glob
import maya.cmds as cmds
import os
import maya.mel as mel
import sys
import subprocess
import pymel.core.general
import time

print "Setting up breakLoop functions. Call breakLoop.breakLoopSetup to create file in /tmp for breaking while loops."

def breakLoopSetup(loopStopperPath = "/tmp/deleteMeToStop"):

    # creates a file in /tmp/ called 'deleteMeToStop'
    # breakLoop() checks this file exists, if it doesn't the while / loop is broken

    a= open(loopStopperPath, 'w')
    a.close()
    print "Created tmp/deleteMeToStop - delete this file to break the loop"



def breakLoop(loopStopperPath = "/tmp/deleteMeToStop"):
    import os
    if os.path.exists(loopStopperPath):
        return False
    else:
        return True

# This function needs to be called while a viewport is selected - best to run it from the shelf during testing
def getCurrentCamera():
    pan = cmds.getPanel(wf=True)
    cam = cmds.modelPanel(pan, q=True, camera=True)
    print cam
    return cam


def doPlayblast(filePath,xRes,yRes):
    print "Playblasting."
    mayafile, file_extension = os.path.splitext(filePath)
    filePath = str(cmds.playblast(filename=mayafile, forceOverwrite=True, showOrnaments=False, percent=100, framePadding=4, format="image", compression="png", offScreen=True, viewer=False, widthHeight=[int(xRes),int(yRes)]))
    print "Filepath "+str(filePath)
    return filePath

def sendToNuke(filePath,xRes,yRes):

    switch = 2
    filename, file_extension = os.path.splitext(filePath)
    file_list = glob.glob(filename[:-4] + "*" + file_extension) # create filtered list of files
    frames = [f[-8:-4] for f in file_list]
    print "Range: "+str(min(frames)), str(max(frames))
    lastFrame = max(frames)

    #makes a "/distorted" directory
    withHash = (filename[:-5] + "_{}.####".format(cam) + file_extension)
    lastFrame = (filename[:-4] + lastFrame + file_extension)
    folderPath, fullFilename = os.path.split(withHash)

    distortedPath = folderPath+"/distorted/"
    exportPath = distortedPath+fullFilename
    exportFilename = (exportPath[:-4]+file_extension)
    lastDistortedFrame = filename[:-4]+max(frames)+file_extension
    if not os.path.isdir( distortedPath ):
        os.mkdir( distortedPath )
        print "Created dir " + distortedPath

    #The command for a shell:
    sillyString = "sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/addDistortionToPlayblast/markTest5.py {} {} '{}' '{}' '{}' '{}' -F {}-{}".format(withHash, exportFilename, switch, focalLength, xRes, yRes, min(frames), max(frames))
    print sillyString
    print exportFilename
    return sillyString, exportFilename,lastFrame,distortedPath,lastDistortedFrame
"""
#Creates tmp/deleteMeToStop - delete this file to break the while loop that looks for finished renders
breakLoopSetup()
while not os.path.isfile(lastFrame):
    print "File found"
    rvPath = "/mnt/pipeline/ATK_PIPELINE/rv/launcher/linux/rv_launcher.sh '{}'".format(exportFilename)
    subprocess.Popen(rvPath, shell=True)
    break
else:
    print "File not found"

"""



"""
def whileRendering(lastFrame,exportFilename):
    finished = os.path.isfile(lastFrame) # WHY IS THIS BIT ALWAYS TRUE EH?
    while finished == False:
        finished = os.path.isfile(lastFrame)
        print "file missing"
        if breakLoop():
            break
    else:
        rvPath = "/mnt/pipeline/ATK_PIPELINE/rv/launcher/linux/rv_launcher.sh '{}'".format(exportFilename)
        subprocess.Popen(rvPath, shell=True)
        print "Opening RV"
"""
"""
sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/addDistortionToPlayblast/markTest4.py /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/test.####.png /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/distorted/test.####.png '0' -F 0001-0002
sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/addDistortionToPlayblast/markTest4.py /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/test.####.png /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/distorted/test.####.png '2' -F 0001-0026


"""

##----------------------------- code here

""" TO DO
* Force overscan, unforce overscan at end
* Pass the output res
* Pass it the lens approx value (nukeX node?)
* Alert if no Nuke Licence Found (send to farm?)

"""
#The filename
mayaFilename = cmds.file(q=True, sn=True)
mayaFilename = os.path.basename(mayaFilename)

# Gets camera info
#cam = getCurrentCamera() #This line only works if viewport is selected
focalLength = cmds.getAttr(cam+'.focalLength')
xRes = int(cmds.getAttr("defaultResolution.width")*1.3)
yRes = int(cmds.getAttr("defaultResolution.height")*1.3)

# temp overscan
preScale = cmds.getAttr(cam+'.preScale')

tempOverscan = preScale * (1 - 0.3)
percentOverscan = 30
cmds.setAttr(cam+'.preScale', tempOverscan)

# Does the playblast and turn off overscan
filePath = doPlayblast(mayaFilename,xRes,yRes)
cmds.setAttr(cam+'.preScale', preScale)

sillyString,exportFilename,lastFrame,distortedPath,lastDistortedFrame= sendToNuke(filePath,xRes,yRes)

# Sends the playblast to Nuke
subprocess.Popen(sendToNuke(filePath,xRes,yRes), shell=True)
print "FocalLength is "+str(focalLength)
print "Sending playblast to Nuke, please wait...   Output path: "+str(exportFilename)
"""
# Subprocess failed when run via nuke. Creating a second process as a sentinel for finished files. Will timeout eventually, should Nuke fail.
whileRendering(lastFrame,exportFilename)
"""


"""
# Opens it in RV (this is now in the Nuke.py)
rvPath = "/mnt/pipeline/ATK_PIPELINE/rv/launcher/linux/rv_launcher.sh '{}'".format(exportFilename)
subprocess.Popen(rvPath, shell=True)
"""

