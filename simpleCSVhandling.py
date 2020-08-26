# Summarise all suffix types 
from csv import reader

file = r"...."

suffixList = set([])
with open(file, 'r') as read_obj:
	csv_reader = reader(read_obj)
	header = next(csv_reader)
	if header != None:
		for row in csv_reader:
			if row[1]:
				if row[1] not in suffixList:
					#print row[1]
					suffixList.add(row[1])
					
				
print suffixList
				

