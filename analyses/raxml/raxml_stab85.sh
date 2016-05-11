#!/bin/bash

# Request an hour of runtime:
#SBATCH --time=48:00:00

#SBATCH --nodes=4
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J MyMPIJob

# Specify an output file
#SBATCH -o MyMPIJob-%j.out
#SBATCH -e MyMPIJob-%j.out

# Run a command

module load raxml/8.2.0

mpirun -n 32 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 500 -m GTRGAMMA -s ../../data/combined_stab85.phy -q ../../data/partitions.txt -n combined_stab85