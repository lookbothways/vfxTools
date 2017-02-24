#Makes a .mov for fTrack from playblasts of the scene 

import os
import maya.mel as mel
import maya.cmds as cmds
import sys


##get project location
ascii = ""
scene = cmds.file(q=1,sn=1)
project = os.path.dirname(os.path.dirname(scene))
print "Project location is :"+project
images = "{}/images/".format(project)
print "Images directory is :"+images

#creates the png in path
filename = scene[:-3]
filename = filename+".%04d.png"
pngSequence = filename.replace("/scenes/", "/images/")
print pngSequence

if scene.endswith('.mb'):
    print "Scene should be saved as .ma - Please resave as .ma when possible."
    ascii = "Please save your scene as a Maya ASCII."


#Creates the mov out path
scenePath = project+"/images/"
print scenePath

filename = scene[:-3]
filename = filename+".mov"
outFile = filename.replace("/scenes/", "/movies/")
print outFile  




sillyString = "/mnt/pipeline/libs/python273/bin/python /mnt/resources/atk_deploy/modules/atk/bin/encode -in {} -out {} -fmt ftrack".format(pngSequence, outFile)
print sillyString

#makes the mov
os.system(sillyString)

#Puts it in the copy buffer:
 
cmds.confirmDialog( title='png to mov', message="Png sequence found. \n.mov created for fTrack. This path is in the copybuffer: {} \n\n {}".format(outFile, ascii), button=['OK'], defaultButton='Yes', cancelButton='No', dismissString='No' )


cb=str(outFile)
from PySide import QtGui
clipboard= QtGui.QApplication.clipboard()
clipboard.setText(cb) # set clipboard
print clipboard.text() # show current clipboard contents    


print "Created quicktime FROM: {} TO: {}.".format(pngSequence, outFile)

