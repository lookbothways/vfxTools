# USAGE
# python detect_blur.py -i images -p percentage to extract

"""
EG:
python /home/mark/Desktop/atk_usefulInfo/detecting-blur/detect_blur.py -i /home/mark/Desktop/atk_usefulInfo/detecting-blur/images -p50

python /mnt/pipeline/ATK_PIPELINE/maya/modules/DCO/scripts/detecting-blur/detect_blur.py -i /mnt/projects/wb/assets/Building/Wind-turbine/LGT/work/images/Matchmove/Set_Survey/Field_Survey/Photos/pngForPano -p50


"""
# import the necessary packagess
import argparse
import cv2
import shutil
import os
import operator


#------
#Paths from imutils https://github.com/jrosebr1/imutils/blob/master/imutils/paths.py

image_types = (".jpg", ".jpeg", ".png", ".bmp", ".tif", ".tiff")


def list_images(basePath, contains=None):
    # return the set of files that are valid
    return list_files(basePath, validExts=image_types, contains=contains)


def list_files(basePath, validExts=None, contains=None):
    # loop over the directory structure
    for (rootDir, dirNames, filenames) in os.walk(basePath):
        # loop over the filenames in the current directory
        for filename in filenames:
            # if the contains string is not none and the filename does not contain
            # the supplied string, then ignore the file
            if contains is not None and filename.find(contains) == -1:
                continue

            # determine the file extension of the current file
            ext = filename[filename.rfind("."):].lower()

            # check to see if the file is an image and should be processed
            if validExts is None or ext.endswith(validExts):
                # construct the path to the image and yield it
                imagePath = os.path.join(rootDir, filename)
                yield imagePath

#-----


def percentage(percent, whole):
  return (percent * whole) / 100.0


def copyFile(imagePath):
    # Make a new folder called output+pc    
    # This line below is problematic if the percentage required has already been run: 
    # It creates an output_ folder in the already-made output_ folder.
    extractParts = str(imagePath).split("/")
    #print extractParts
    folderName = "output_"+str(percentageArg)+"pc"
    folderOnly = str(imagePath.split(extractParts[-1])[0])
    folderToCreate = folderOnly+folderName 
    fileOnly = extractParts[-1]
    outputPath = folderOnly+ "output_"+str(percentageArg)+"pc/"+fileOnly
    if not os.path.exists(folderToCreate):
        #print "Creating output folder: "+folderToCreate
        os.makedirs(folderToCreate)
        
    if not os.path.exists(outputPath):
        shutil.copy(imagePath,outputPath)
        print("Copied: "+ imagePath)
    else:
        print "File exists!" 
    return

def variance_of_laplacian(image):
	# compute the Laplacian of the image and then return the focus
	# measure, which is simply the variance of the Laplacian
	return cv2.Laplacian(image, cv2.CV_64F).var()

#--------------------- code starts here

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--images", required=True,
	help="Path to input directory of images.")
#If reintroducing threshold option:
#ap.add_argument("-t", "--threshold", type=float, default=100.0,
#	help="Focus measures that fall below this value will be considered 'blurry'.")
ap.add_argument("-p", "--percentage", required=True,
	help="Percentage of images to return.")
args = vars(ap.parse_args())

# calculate the number of files to extract
imagesList = list(list_images(args["images"]))
numberOfFiles = len(imagesList)
percentageArg = int(args["percentage"])
numberToCopy = int(percentage(percentageArg, numberOfFiles))

print "Number of files "+str(numberOfFiles)
print "Percentage of best images to extract: "+str(args["percentage"])
print "Number of files to copy "+str(int(percentage(percentageArg, numberOfFiles)))
print "Reading folder contents..."

imagesDict = {}
#print imagesDict


# loop over the input images
for imagePath in list_images(args["images"]):
	# load the image, convert it to grayscale, and compute the
	# focus measure of the image using the Variance of Laplacian method
	image = cv2.imread(imagePath)
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	fm = variance_of_laplacian(gray)
	text = "Not Blurry"
	imagesDict[imagePath] = fm

	
sortedByWorstToLeastBlurry = sorted(imagesDict.items(), key=operator.itemgetter(1))
filesToCopy = sortedByWorstToLeastBlurry[-numberToCopy:numberOfFiles]

# Extract just the str, to get a list of only the filepaths to copy
pathsOnly = [((t[0],)+t[2:]) for t in filesToCopy]

for each in pathsOnly:
	each = str(each[0])
	copyFile(each)
