pdb=$1
dir=/data02/daniel/masif/site/data_preparation/01-benchmark_pdbs
pdbPath=$dir/$pdb

python predict.py \
-ftype pdb -m 0 \
-i $pdbPath \
-mpath whole_trained_model1.hdf \
-otype mol2 -o output_folders \
-gpu 1
