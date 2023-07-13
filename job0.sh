#!/bin/bash
#SBATCH -J prot
#SBATCH -o prot.o%j
#SBATCH -p normal
#SBATCH -N 64
#SBATCH -n 128   # Total number of MPI tasks for  all nodes
#SBATCH -t 00:20:00
##SBATCH -A TG-MCB160119
##SBATCH --mail-user=yichun.lin@westernu.edu
#SBATCH --mail-type=ALL

jobid=0
module load intel/16.0.3 impi namd/2017_12_05

ibrun namd2_knl +ppn 64 +pemap 0-63+68 +commap 64-67 +replicas 128 fep_site_init.conf --source FEP_remd_wca.namd +stdout output_site/%d/job${jobid}.%d.log
