#!/bin/bash
#SBATCH -J get-100ps 
#SBATCH -o get-100ps.o%j
#SBATCH -p development
#SBATCH -N 1
#SBATCH -n 1   # Total number of MPI tasks for  all nodes
#SBATCH -t 2:00:00
##SBATCH -A TG-MCB160119
#SBATCH --mail-user=luoyun724@gmail.com
#SBATCH --mail-type=ALL

sh ./wham_data_solv.sh
sh ./wham_fe.sh
perl ./sum_fe.pl
