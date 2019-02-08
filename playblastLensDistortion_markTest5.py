import sys
import nuke
import subprocess
import time

def runRV(writepath):
	rvPath = "/mnt/pipeline/ATK_PIPELINE/rv/launcher/linux/rv_launcher.sh '{}'".format(writepath)
	subprocess.Popen(rvPath, shell=True)



readpath= sys.argv[1]
writepath= sys.argv[2]
lens= int(sys.argv[3])
focalLength= float(sys.argv[4])
xRes= int(sys.argv[5])
yRes= int(sys.argv[6])

nuke.scriptOpen('/mnt/resources/nuke/addDistortionToPlayblast/markTest4.nk')

#Read
r= nuke.toNode('Read1')
r['file'].setValue(str(readpath))


#lensDistortion chosen via switch
switch= nuke.toNode('Switch1')
switch['which'].setValue(lens)


#Sets distortionDeonminator via expression to nukeX node
LD= nuke.toNode('focalLengthToDistDenom')
LD['focal'].setValue(focalLength)


#write
w= nuke.toNode('Write1')
w['file'].setValue(str(writepath))

"""
#failing on callback
#waits a bit before trying RV
time.sleep(5)
nuke.addAfterRender(runRV(writepath))
#nuke.removeAfterRender(runRV(writepath))
"""

"""
#For shell:

sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/addDistortionToPlayblast/markTest4.py /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/test.####.png /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/distorted/test.####.png '0' -F 0001-0002

sh /mnt/pipeline/ATK_PIPELINE/nuke/launcher/workstation/linux/Nuke_Batch_Launcher.sh -x /mnt/resources/nuke/addDistortionToPlayblast/markTest4.py /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/test.####.png /mnt/projects/dco/assets/Environment/temp/LKD/work/maya/images/distorted/test.####.png '2' -15 1920 -F 1080-0001


"""
