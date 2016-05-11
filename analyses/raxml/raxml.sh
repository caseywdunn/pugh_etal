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

module load raxml

mpirun -n 32 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 500 -m GTRGAMMA -s ../../data/combined.phy -q ../../data/partitions.txt -n combined
mpirun -n 32 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 500 -m GTRGAMMA -s ../../data/16s.phy -n 16s
mpirun -n 32 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 500 -m GTRGAMMA -s ../../data/18s.phy -n 18s