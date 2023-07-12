# Piezo1-BindingFreeEnergy
1. run mkdir.pl to generate 128 folders to save 128 lambda run
2. set up protein-ligand distance restraint in inputfiles/*namd.col (for large ligand, add ligand RMSD restraint to improve sampling)
3. change B column to 1 for ligand atoms in inputifles/pdb.fep
4. make sure you have all inputfiles needed for fep_site_init.namd
5. run job0.sh. Once done, check the acceptance ration in output files. If some ratio are low between certain lambda,  modify "num_replicas" in fep_site.conf. By default, we use 96  for repulsion, 16 for dispersion, 16 for electrostatics". But the optimal distribution of replicas depends on each system.
6. continue with job1.sh, job2.sh (modify restart_1.conf if necessary)
7. run get_freeEnergy/wham_data_solv.sh to compute free energy for each job and plot convergence
8. run sortreplica-stampede2.sh to unscramble trajectories so each trajectory represents one lambda value. The 0 is fully decoupled and 127 is fully coupled.
