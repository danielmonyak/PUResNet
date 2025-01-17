source /apps01/anaconda3/etc/profile.d/conda.sh
conda activate venv_pnet

pdb=$1
dir=/data02/daniel/masif/masif_ligand/data_preparation/01-benchmark_pdbs
pdbPath=$dir/$pdb.pdb
outdir=/data02/daniel/PUresNet/site_predictions

python predict.py \
-ftype pdb -m 0 \
-i $pdbPath \
-mpath whole_trained_model1.hdf \
-otype mol2 -o $outdir \
-gpu 0
