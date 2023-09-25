#!/bin/bash
#SBATCH -N 1
#SBATCH -n 2
#SBATCH --qos=normal
#SBATCH --job-name=example
#SBATCH --output=run_example.out
#SBATCH --time 0-02:00

rm -rf output

echo "Running test model at $(date)"

mpiexec nrniv -mpi -quiet -python run_example.py

echo "Done running test model at $(date)"
