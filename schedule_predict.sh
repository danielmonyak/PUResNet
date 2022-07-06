out=output_files
if [ ! -d $out ]; then mkdir $out; fi

batchSize=10
sleep_time=10

i=0
unset running
while read p; do
	if [ $(( i % $batchSize )) -eq 0 ]; then
		for pid in ${running[@]}; do
			while ps -o pid ax | grep -q $pid; do
				sleep $sleep_time
			done
		done
		running=()
	fi
	FIELD1=$(echo $p| cut -d" " -f1)
       	PDBID=$(echo $FIELD1| cut -d"_" -f1)
      	CHAIN1=$(echo $FIELD1| cut -d"_" -f2)
       	CHAIN2=$(echo $FIELD1| cut -d"_" -f3)
 	./predict.sh $PDBID\_$CHAIN1\_$CHAIN2 > $out/$p.out 2>&1 &
	disown -h $!
	running+=($!)
	i=$((i+1))
done < pdbs_list.txt

echo Finished!
