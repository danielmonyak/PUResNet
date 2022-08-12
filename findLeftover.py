import os
import numpy as np

#all = np.loadtxt('filtered_pdbs.txt', dtype=str)
all_pdbs = np.loadtxt('/home/daniel.monyak/software/masif/data/masif_ligand/newPDBs/using_pdbs_final_reg.txt', dtype=str)
all_pdbs = np.char.rstrip(all_pdbs, '_')
done = os.listdir('/data02/daniel/PUresNet/site_predictions')

todo = all_pdbs[~np.isin(all_pdbs, done)]
np.savetxt('todo.txt', todo, fmt='%s')
