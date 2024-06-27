#!/bin/bash

file_name=$1
first="true"
num1=0 num2=0 num3=0 num4=0 num5=0 antnum5=0 num6=0 num7=0
#TAG="Full_time_for"
TAG="Predict"

sumMedia=0

i=0
readfiles() {
	while read -r line; do
	    	line_data=$(echo "${line}" | grep "$TAG" | sed -r 's/[^0-9]+/ /g')
	 	if [[ -n "$line_data" ]]; then
	 		IFS=' ' read num1 num2 num3 num4 num5 num6 num7 <<< "${line_data}"
	 		sumMedia="$(( num7 + sumMedia ))"
	 		echo "$num7" >> plot_"$TAG".dat 
	 	fi    
	done < $file_name
}

if [ -f "plot_"${TAG}".dat" ]; then
    echo "Remove file "$plot_"${TAG}".dat""
    rm plot_"$TAG".dat 
fi

for file in testes/*.txt; do
    file_name="$file"
    readfiles 
    echo "$file"
done


amostras=$(wc -l < plot_"$TAG".dat )
media=$( bc<<< "scale=4; ($sumMedia/$amostras)")

DP=0
while read -r line; do
    DP=$(bc <<< "scale=0; (($line - $media)^2+$DP)")   
done < plot_"$TAG".dat

DP=$(bc <<< "scale=4; sqrt($DP/$amostras)")

echo "Numero de amostras= "$amostras""
echo "Media= "$media""
echo "Desvio padrão= "$DP", "$(bc <<< "scale=2; (($DP / $media)*100)")"%"

gnuplot <<EOF
set terminal png
set output "Plot_($TAG)_DP.png"
plot 'plot_$TAG.dat' using 0:1 with lines, $media, $media - $DP, $media + $DP
EOF


#set terminal wxt  enhanced title "Walt's steps " persist rais

gnuplot <<EOF
set key off
set border 3
set yzeroaxis
set boxwidth 0.5 absolute
set style fill solid 1.0 border
set terminal png
set output "Plot_($TAG)_Histograma.png"
bin_width = 0.1;
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.5 )
plot 'plot_$TAG.dat' using (rounded(column(1))):(1) smooth frequency with boxes
EOF

#generate_plot.gnu
#a=$(bc <<< "scale=0; sqrt($VAR)")
#a=$(bc <<< "scale=0; ($VAR)^2")
#c=$( bc -l <<< "$a / ( $b -34 )")


#Sigma linha -e  onde eu que llegar






#nlinha = 4 * sigma(desvio padraão normal)^2 + 1
#signa lina = desio padrao da media das medidas. 



































