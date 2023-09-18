#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --qos=normal
#SBATCH --job-name=example
#SBATCH --output=build_example.out
#SBATCH --time 0-00:30

echo "building test model at $(date)"

rm -rf network

python3 build_example.py

echo "Done building test at $(date)"
