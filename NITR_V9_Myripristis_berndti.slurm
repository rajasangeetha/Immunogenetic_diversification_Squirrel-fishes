#!/bin/sh
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=132gb
#SBATCH --partition=Orion

###This script creates version 9 of the Holocentridae - for NITR

#module load anaconda3/2020.11

#**********#
# Step 3 #
#**********#
### Change the file name <***********.fa> for each protein file

### hmmsearch
### Search sequences
#/apps/pkg/busco/4.0.6/bin/hmmsearch NITR.hmm /scratch/rvijaya1/HolocentridaeFiles/Myripristis_berndti_translated.fa > Myrip_ber.hmmSearch.out

#**********#
# Step 4 #
# Creates the hits file
#**********#
#module load anaconda3/
#python HMMsearch_parser.py Myrip_ber.hmmSearch.out /scratch/rvijaya1/HolocentridaeFiles/Myripristis_berndti_translated.fa

#**********#
# Step 5 #
#**********#
#First time use the ray finned fish file for merging
#merge  combined file from previous run and output from step 2 and create new combined file
#For the first time ray_finned_psmb8_out.fa is used. Next time onwards Comibned file would be used

#combining 8 and Myripristis_berndti
#python renameAndMerge.py Myrip_ber.hmmSearch.out combined_NITR_Holocentridae_V8_NS061_out.fa combined_NITR_Holocentridae_V9_Myrip_ber.fa 


#**********#
# Step 6 #
#**********#
##Perform MAFFT alignment for the combined file

#module load mafft
#mafft --anysymbol combined_NITR_Holocentridae_V9_Myrip_ber.fa > combined_NITR_Holocentridae_V9_Myrip_ber_out.fa


#**********#
# Step 7 #
#**********#
#Call iqTree 
#with boostrap
/scratch/rvijaya1/iqtree
/apps/pkg/iqtree/2.1.2/bin/iqtree2 -s combined_NITR_Holocentridae_V9_Myrip_ber_out.fa -B 1000