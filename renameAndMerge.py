###Author: RajaSangeetha Vijayam
###Date: 06/30/2022

import os
import sys
from shutil import copyfile

file2 = sys.argv[1] + "_hits.fa"
file1 = sys.argv[1] + "_hits.txt"

copyfile(file1, file1 + ".backup")
os.rename(file1, file2)

#file4 = sys.argv[2] + ".fa"
#file3 = sys.argv[2] + ".txt"
file3 = sys.argv[2]

copyfile(file3, file3 + ".backup")
#os.rename(file3, file4)

inputFiles = [file2, file3]

with open(sys.argv[3], 'w') as outFile:
    for currentFile in inputFiles:
        with open(currentFile) as inFile:
            outFile.write(inFile.read())
        outFile.write("\n")