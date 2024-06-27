#!/bin/bash

end_process(){
  
  	gnuplot -p generate_plot.gnu
	echo "END PROCESS"
	exit 1
}

trap end_process SIGINT

if [ -f data_plot.dat ] 
then
	rm data_plot.dat
fi

rm generate_data


gcc -Wall -o generate_data generate_data.c

./generate_data&

tail -f /var/log/syslog | grep --line-buffered generate_data >> data_plot.dat




#writedata(){
#   for i in {1..20}; do
#	echo -e $i"\t"$((i*i)) >> data.dat
#	sleep 1
#	echo "done"
#   done
#}

#writedata &

#sleep 1
#gnuplot liveplot.gnu
