#!/bin/sh
#SBATCH --time=01:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=132gb
#SBATCH --partition=Orion

###This script creates the hmm guide file for PSMB Gene for Holocentridae usng ray_finned_psmb8.fa sequence

###These two set of commands (MAFFT and HMM Build) are executed first time only once for each gene types in this case - ray_finned PSMB

#**********#
# Step 1 #
#**********#
#module load mafft
#mafft --auto --inputorder --reorder --anysymbol ray_finned_psmb8.fa > ray_finned_psmb8_out2.fa

#**********#
# Step 2 #
#**********#
### hmmbuild
module load busco/4.0.6
/apps/pkg/busco/4.0.6/bin/hmmbuild psmb.hmm ray_finned_psmb8_out2.fa

