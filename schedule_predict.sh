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
 	./predict.sh $p > $out/$p.out 2>&1 &
	disown -h $!
	running+=($!)
	i=$((i+1))
done < todo.txt
echo Finished!
