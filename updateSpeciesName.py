## Author Sangeetha Vijayam
## Date July 21 2022
#### This program is part of an internship project - The evolution of immunogenetic diversity in Holocentridae
#### This program is to read a protein file and prepend Species name to the sequence 
#### Ex: > is appended with Myripristis_murdjan_
#### Version 2: Input is passed from the calling program instead of getting from the user
#### Version 3: Take backup of protein file before updating species name

######>XP_029899870.1 E3 ubiquitin-protein ligase TRIM21-like [Myripristis murdjan] ######MSAASSL......

######>Myripristis_murdjan_XP_029899870.1 E3 ubiquitin-protein ligase TRIM21-like [Myripristis murdjan] ######MSAASSLL.....

import fileinput
import sys
from shutil import copyfile

print("Begining update Species Name in the protein sequence file")

#For Jupyter Notebook testing
#sys.argv=['self.py','Myripristis_amaena_NS038_longest_orfs.fa','Myripristis_amaena']


##Example input file name GCF_902150065.1_protein.fa
input_file = sys.argv[1]
sequenceCount = 0

print("Taking backup of the protein file")
copyfile(input_file, input_file + "_backup")


seqStartChar = ">"
##Example speciesName with underscore Myripristis_murdjan
speciesName = speciesName = sys.argv[2]

updatedSeq = seqStartChar + speciesName + "_"

with fileinput.FileInput(input_file, inplace=True) as file_object:
    for line in file_object:
        if seqStartChar in line:
            sequenceCount = sequenceCount + 1
        print(line.replace(seqStartChar, updatedSeq), end='')              
            
file_object.close()

print("Number of sequences in the file : " + str(sequenceCount))

print("Ending update Species Name in the protein sequence file")