# Immunogenetic_diversification_Squirrel-fishes
Consequence of biodiversity on immunogenetic diversification using Squirrel fishes (Holocentridae) - an emblematic clade of nocturnal coral-reef fishes


In HMMsearch_parser.py

while creating '_summary.txt' file the end index should match with the sequence id end idex of the fasta file

        if '.1' in line:
            #print("end in index .1")
            end = line.index('.1')


replace .1 with the appropriate end index
