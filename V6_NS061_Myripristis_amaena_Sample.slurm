#!/bin/sh
#SBATCH --time=00:20:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=32gb
#SBATCH --partition=Orion

###Author: RajaSangeetha Vijayam
###Date: 06/30/2022
###This script is a sample script to generate IQTree of the Holocentridae - Myripristis amaena for TLR
###TLR1.hmm is built using hmmbuild command by passing TLR_out.fa file similar to the third command below

module load anaconda3/2020.11

####Give species name with underscore

#python updateSpeciesName.py /scratch/rvijaya1/HolocentridaeFiles/Myripristis_amaena_NS061.fasta Myrip_ama

/apps/pkg/busco/4.0.6/bin/hmmsearch TLR1.hmm /scratch/rvijaya1/HolocentridaeFiles/Myripristis_amaena_NS061.fasta > Myrip_ama_NS061.hmmSearch.out

#python HMMsearch_parser.py Myrip_ama_NS061.hmmSearch.out /scratch/rvijaya1/HolocentridaeFiles/Myripristis_amaena_NS061.fasta

#python renameAndMerge.py Myrip_ama.hmmSearch_NS061.out combined_NITR_Holocentridae_V5.fa combined_NITR_Holocentridae_V6.fa 

#module load mafft
#mafft --anysymbol combined_NITR_Holocentridae_V6.fa > combined_NITR_Holocentridae_V6_out.fa

#/apps/pkg/iqtree/2.1.2/bin/iqtree2 -s combined_NITR_Holocentridae_V6_out.fa