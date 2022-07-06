./schedule_predict.sh > schedule_predict.out 2>&1 &
disown -h $!
echo $! > schedule_predict_pid.txt
