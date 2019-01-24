# USAGE
# python detect_blur.py --images images
# python /home/mark/Desktop/atk_usefulInfo/detecting-blur/detect_blur.py -i /mnt/projects/dco/reference/boat/stills/all -t 200
# python /home/mark/Desktop/atk_usefulInfo/detecting-blur/detect_blur.py -i /home/mark/Desktop/atk_usefulInfo/detecting-blur/images -t 200
# python /home/mark/Desktop/atk_usefulInfo/detecting-blur/detect_blur.py -i /mnt/projects/dco/reference/boat/stills/all/sample -t 41
# /mnt/projects/dco/reference/boat/stills/all/sample


# import the necessary packages
from imutils import paths
import argparse
import cv2
import shutil
import os

def copyFile(imagePath):
    # Make a new folder called output       
    extractParts = str(imagePath).split("/")
    folderOnly = str(imagePath.split(extractParts[-1])[0])
    fileOnly = extractParts[-1]
    outputPath = folderOnly+ "output/"+fileOnly
    if not os.path.exists(folderOnly+"output/"):
        print "Creating output folder"
        os.makedirs(folderOnly+"output")
        
    if not os.path.exists(outputPath):
        shutil.copy(imagePath,outputPath)
        print("Copied to /output: "+ imagePath)
    else:
        print "File exists!" 
    return

def variance_of_laplacian(image):
	# compute the Laplacian of the image and then return the focus
	# measure, which is simply the variance of the Laplacian
	return cv2.Laplacian(image, cv2.CV_64F).var()

# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--images", required=True,
	help="path to input directory of images")
ap.add_argument("-t", "--threshold", type=float, default=100.0,
	help="focus measures that fall below this value will be considered 'blurry'")
args = vars(ap.parse_args())

# loop over the input images
for imagePath in paths.list_images(args["images"]):
	# load the image, convert it to grayscale, and compute the
	# focus measure of the image using the Variance of Laplacian
	# method
	image = cv2.imread(imagePath)
	print "IMAGE "+ str(image)
	print "IMAGEPATH "+ str(imagePath)
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	fm = variance_of_laplacian(gray)
	text = "Not Blurry"

	# if the focus measure is less than the supplied threshold,
	# then the image should be considered "blurry"
	if fm > args["threshold"]:
		text = "Not Blurry"
		print "NOT Blurry"
		copyFile(imagePath)
"""
		# show the image
		cv2.putText(image, "{}: {:.2f}".format(text, fm), (10, 30),
			cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 3)
		cv2.imshow("Image", image)
		key = cv2.waitKey(0)"""
		
		


# adds an output folder to the current path and copies the input path to it



    
#------



#change this to the output from the detect_blur.py script
#fullImagePath="/home/mark/Desktop/atk_usefulInfo/detecting-blur/images/image_001.png"

#copyFile(fullImagePath)
