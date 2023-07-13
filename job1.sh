#!/bin/bash
#SBATCH -J prot
#SBATCH -o prot.o%j
#SBATCH -p normal
#SBATCH -N 128
#SBATCH -n 128   # Total number of MPI tasks for  all nodes
#SBATCH -t 20:00:00
##SBATCH -A TG-MCB160119
#SBATCH --mail-user=luoyun724@gmail.com
#SBATCH --mail-type=ALL

jobid=1
module load intel/16.0.3 impi namd/2017_12_05

#NAMD_Git-2019-04-23_Linux-x86_64-multicore/namd2 +idlepoll step4_equilibration.inp >& step4_equilibration.log

#ibrun namd2 +ppn 32 step4_equilibration.inp >& step4_equilibration.log
#ibrun NAMD_Git-2019-04-23_Linux-x86_64-multicore/namd2 +replicas 64 fep_site.conf --source FEP_remd_wca.namd +stdout output_site/%d/job1.%d.log
ibrun namd2_knl +ppn 128 +pemap 0-63+68 +commap 64-67 +replicas 128 restart_${jobid}.conf --source FEP_remd_wca.namd +stdout output_site/%d/job${jobid}.%d.log
