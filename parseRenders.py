import csv
import os

print ("Parsing renders textfile:")
with open ("renders.txt", "r") as rendersRaw:
    data= rendersRaw.readlines()

line = ["jobID","jobName"]
output = []

for each in data:
    split= each.split()
    jobID= split[0]
    jobName= split[3]
    line= jobID +" "+ jobName
    line= line.split()
    output.append(line)
    
print (output)
with open('rendersTemplate.csv', 'r') as readFile:
    reader = csv.reader(readFile)
    lines = list(reader)
    #lines[2] = output
    lines = output

with open('rendersFormatted.csv', 'w', newline='') as writeFile:
    writer = csv.writer(writeFile)
    writer.writerows(lines)
    
readFile.close()
writeFile.close()



"""
# Python 2
with open('/pythonwork/thefile_subset11.csv', 'wb') as outfile:
    writer = csv.writer(outfile)

# Python 3
with open('/pythonwork/thefile_subset11.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)

