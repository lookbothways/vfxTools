# index processing
from csv import reader
import os

index = r"...txt"

suffixList = set([])
with open(index, 'r') as read_obj:
	csv_reader = reader(read_obj)
	for row in csv_reader:
		if row[0]:
			suffix = os.path.splitext(str(row))
			suffix = str(suffix[-1])[:-2].lower()
			if suffix not in suffixList:
				suffixList.add(suffix)
				print str(suffixList)+ "\n"
				
