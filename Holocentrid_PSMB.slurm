#!/bin/sh
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=132gb
#SBATCH --partition=Orion

###This script creates version 1 Tree of the Holocentridae - for PSMB


###These two set of commands (MAFFT and HMM Build) are executed first time only once for each gene types in this case - ray_finned PSMB

#**********#
# Step 1 #
#**********#
#module load mafft
#mafft --auto --inputorder --reorder --anysymbol ray_finned_psmb8.fa > ray_finned_psmb8_out.fa

#**********#
# Step 2 #
#**********#
### hmmbuild
module load busco/4.0.6
#/apps/pkg/busco/4.0.6/bin/hmmbuild psmb.hmm ray_finned_psmb8_out.fa

#**********#
# Step 3 #
#**********#
### Change the file name protein_GCF_902150065.1_small.fa for each protein file

### hmmsearch
/apps/pkg/busco/4.0.6/bin/hmmsearch psmb.hmm Myripristis_amaena_NS061_small.fasta > Holocentridae_Test.hmmSearch.out

#**********#
# Step 4 #
#**********#
module load anaconda3/
#python HMMsearch_parser.py Holocentridae1.hmmSearch.out protein_GCF_902150065.1_small.fa

#**********#
# Step 5 #
#**********#
#merge  Holocentridae1  and ray_finned_psmb8_out create new combined file
#Next time use this combined file to create Combined_Holocentridae2 file

#rename (.txt to .fa) and combine files - rename Combined file to 2, 3 etc for subsequent steps
#For the first time ray_finned_psmb8_out.fa is used. Next time onwards Comibned file would be used
#python renameAndMerge.py Holocentridae1.hmmSearch.out ray_finned_psmb8_out.fa Combined_Holocentridae1_PSMB.fa

#**********#
# Step 6 #
#**********#
#module load mafft
#mafft --anysymbol Combined_Holocentridae1_PSMB.fa > Combined_Holocentridae1_PSMB_out.fa

#**********#
# Step 7 #
#**********#
#with boostrap
#/scratch/rvijaya1/iqtree
#/apps/pkg/iqtree/2.1.2/bin/iqtree2 -s Combined_Holocentridae1_PSMB_out.fa -B 1000
