""" 
Finds missing files from lostfiles.csv
Writes new .csv of found files and definitely missing files.

To do:
make os.path windows paths to / if backslash causing issues
Read and loop through the lostFiles CSV
Process missing sequences: Seach for up-to-. and if more than one file found

Handling the csv:
* If column A in lostFile == File use singleFile function, else look for sequence
* Output new .csv with lostFileName foundPath
* Entries that can't be found say 'Not found anywhere in '+path 

"""
import os
from csv import reader
import ntpath
import csv

def findSingleFile(name, path):
	for root, dirs, files in os.walk(path):
		if name in files:
			print "found "+name
			print os.path.join(root, name)+ "\n"
			return os.path.join(root, name)


# Fill in these three paths:		   

# 1: Enter the path to the lostfiles.csv - the file that lists all broken links:
lostFilesCSV = r".....csv"

# 2: Which directory should it search in (recursively)?
searchpath = r"path"

# 3 the output file.csv
outfilePath = 'foundMissingFiles.csv'


#--------------------------------------------
outlist = []
localFiles = []
# Load the lostfile.csv
# skip first line i.e. read header first and then iterate over each row as a list
with open(lostFilesCSV, 'r') as read_obj:
	csv_reader = reader(read_obj)
	header = next(csv_reader)
	if header != None:
		for row in csv_reader:
			if row[0] == str("File Not found:") and str(r"\\") in row[1] and str("Users") not in row[1]:
				found = ""
				lostFileName = ntpath.basename(row[1])
				print "Searching for "+ str(lostFileName)
				found = findSingleFile(lostFileName,searchpath)+"\n"
				if found:
					found = found+ "\n"
					outlist.append(found)
				else:
					print str(row[0])+ " Not found anywhere in: " +str(searchpath)
			else:
				print "User path found: "+ row[1]
				localFiles.append(row[1])


print localFiles 
print outlist
fileOut = open(outfilePath,"w+") 
fileOut.writelines(outlist)
fileOut.close()
