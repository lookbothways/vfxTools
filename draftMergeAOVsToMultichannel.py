"""
# Run this in a shell:
#!/usr/bin/env bash
export PYTHONPATH="/mnt/deadlinerepository/draft/Linux/64bit:/mnt/deadlinerepository/api/python"
export MAGICK_CONFIGURE_PATH="/mnt/deadlinerepository/draft/Linux/64bit"
export LD_LIBRARY_PATH="/mnt/deadlinerepository/draft/Linux/64bit"

/opt/Thinkbox/Deadline10/bin/python2.7 "/mnt/pipeline/ATK_PIPELINE/maya/modules/ATK/all/release/2017x64/scripts/LONshelf/autoArnoldDenoicer/draftMergeAOVsToMultichannel.py"


#-----------------------
#Example noice:
/mnt/pipeline/ATK_PIPELINE/maya/modules/2017x64/mtoa_3.0.1.1/bin/noice -patchradius 3 -searchradius 9 -variance 0.5  -i /mnt/pipeline/ATK_PIPELINE/maya/modules/ATK/all/release/2017x64/scripts/LONshelf/autoArnoldDenoicer/demoFiles/D.exr -output /mnt/pipeline/ATK_PIPELINE/maya/modules/ATK/all/release/2017x64/scripts/LONshelf/autoArnoldDenoicer/demoFiles/Denoiced.exr

# Output from this causes an error in noice:
# The number of output paths does not match the number of inputs.

#--------------

C:\solidangle\mtoadeploy\2018\bin\noice -i beauty\denoise_me.exr -i variance\denoise_me.exr -i N_noice\denoise_me.exr -i Z_noice\denoise_me.exr -o denoised.exr
noice 5.2.0.0 [4fb9451c] - the Arnold denoiser
Loading images...
Using 40 threads.
Loading file "beauty\denoise_me.exr".
Loading file "variance\denoise_me.exr".
Loading file "N_noice\denoise_me.exr".
Loading file "Z_noice\denoise_me.exr".
Using feature AOV 'N'
Using feature AOV 'Z'
Working with 1 frame.
Will denoise AOV "RGBA"
Found variance for AOV "RGBA"
Start denoising (patch radius 3, search radius 9, variance 0.5)
Denoising RGBA
Finished denoising
Saving image denoised.exr (960 x 540 x 4)


"""
import os
import Draft

noiceAOVs = "beauty", "diffuse_albedo_noice", "N_noice", "Z_noice", "variance"
lightGroups = "L_hdr", "L_key", "L_rim", "L_fill"
#Replace this with GUI (Nuke + Maya)
inputPath = "/mnt/projects/ibk/sequences/RL04_UTP/IBK_RL04_UTP_020/LGT/work/maya/images/IBK_RL04_UTP_020_LGT_noiceTest_v008_aovs/masterLayer/32b/IBK_RL04_UTP_020_LGT_noiceTest_v008_aovs.masterLayer.beauty.1126.exr"

file = os.path.basename( inputPath )
path,renderLayer,aov,frame,exr = inputPath.split(".")
fileName = path.split("/")[-1]
outputPath = os.path.dirname( inputPath )+"/"
writePath = os.path.dirname( inputPath )+"/"+fileName+"."+renderLayer+".forDenoicer."+frame+"."+exr
filesToMerge = []
allAOVs = noiceAOVs+ lightGroups

for separateAOV in allAOVs:
    aovFile = [fileName+"."+renderLayer+"."+separateAOV+"."+frame+"."+exr]
    filesToMerge.extend(aovFile)

aovRGBA = Draft.Image.ReadFromFile( outputPath+filesToMerge[0] )# RGBA
aovA = Draft.Image.ReadFromFile( outputPath+filesToMerge[0] )# Beauty
aovB = Draft.Image.ReadFromFile( outputPath+filesToMerge[1] )# diffuse_albedo
aovC = Draft.Image.ReadFromFile( outputPath+filesToMerge[2] )# N_noice
aovD = Draft.Image.ReadFromFile( outputPath+filesToMerge[3] )# Z_noice
aovE = Draft.Image.ReadFromFile( outputPath+filesToMerge[4] )# variance
aovA.GetChannelNames()
aovB.GetChannelNames()
aovC.GetChannelNames()
aovD.GetChannelNames()
aovE.GetChannelNames()


for ch in [ 'R', 'G', 'B', 'A' ]:
    aovA.RenameChannel( ch, 'beauty.' + ch )
    aovE.RenameChannel( ch, 'variance.' + ch )
    
for ch in [ 'R', 'G', 'B' ]:
    #aovC.RenameChannel( ch, 'N_noice.' + ch )
    aovB.RenameChannel( ch, 'diffuse_albedo_noice.' + ch )

#N is RGB = XYZ    
aovC.RenameChannel( 'R', 'N_noice.' + 'X' )
aovC.RenameChannel( 'G', 'N_noice.' + 'Y' )
aovC.RenameChannel( 'B', 'N_noice.' + 'Z' )
#Z is Y
aovD.RenameChannel( 'Y', 'Z_noice' )


#imgC = Draft.Image.CreateImage( aovA.width, aovA.height, [ 'R', 'G', 'B', 'A', 'beauty.R', 'beauty.G', 'beauty.B', 'beauty.A', 'diffuse_albedo.R', 'diffuse_albedo.G', 'diffuse_albedo.B', 'diffuse_albedo.A', 'N_noice.R', 'N_noice.G', 'N_noice.B', 'Z_noice.Y', 'variance.R', 'variance.G', 'variance.B', 'variance.A' ] )
#imgC = Draft.Image.CreateImage( aovA.width, aovA.height, [ 'R', 'G', 'B', 'A', 'diffuse_albedo_noice.R', 'diffuse_albedo_noice.G', 'diffuse_albedo_noice.B', 'N_noice.R', 'N_noice.G', 'N_noice.B', 'Z_noice.Y', 'variance.R', 'variance.G', 'variance.B', 'variance.A' ] )
imgC = Draft.Image.CreateImage( aovA.width, aovA.height, [ 'R', 'G', 'B', 'A', 'diffuse_albedo_noice.R', 'diffuse_albedo_noice.G', 'diffuse_albedo_noice.B', 'N_noice.X', 'N_noice.Y', 'Z_noice', 'N_noice.Z', 'variance.R', 'variance.G', 'variance.B', 'variance.A' ] )

#Sets 32bit float output. But causes tearing! Arg.
fileChannelMap = { 'R':'32f', 'G':'32f', 'B':'32f', 'A':'32f', 'N_noice.X':'32f', 'N_noice.Y':'32f', 'N_noice.Z':'32f', 'diffuse_albedo_noice.R':'32f', 'diffuse_albedo_noice.G':'32f', 'diffuse_albedo_noice.B':'32f', 'Z_noice':'32f', 'variance.R':'32f', 'variance.G':'32f', 'variance.B':'32f', 'variance.A':'32f' }
imgC.SetFileChannelMap( fileChannelMap )

imgC.Copy( aovRGBA, channels=[ 'R', 'G', 'B', 'A' ] )
#imgC.Copy( aovA, channels=[ 'beauty.R', 'beauty.G', 'beauty.B', 'beauty.A' ] )
imgC.Copy( aovB, channels=[ 'diffuse_albedo_noice.R', 'diffuse_albedo_noice.G', 'diffuse_albedo_noice.B' ] )
imgC.Copy( aovC, channels=[ 'N_noice.X', 'N_noice.Y', 'N_noice.Z' ] )
imgC.Copy( aovD, channels=[ 'Z_noice' ] )
imgC.Copy( aovE, channels=[ 'variance.R', 'variance.G', 'variance.B', 'variance.A' ] )

# do lightGroups also if this works
imgC.WriteToFile( writePath )
