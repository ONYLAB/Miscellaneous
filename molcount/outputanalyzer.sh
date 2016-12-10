#!/bin/bash
# USAGE: ./outputanalyzer.sh molectypes.dat
# This script automatically reads molectypes.dat
# Must be placed at the same address as molectypes.dat, time_molec_number.dat, time_molec_text.dat
# Creates a folder named Molec_vs_time
# Puts the output files (NumMolecules_vs_time.dat) into Molec_vs_time

mkdir Molec_vs_time
paste time_molec_text.dat time_molec_number.dat > pasted.dat

while IFS='' read -r line || [[ -n "$line" ]]; do

    awk -F"\t" -vvar="$line" '{ 
		for(i=1;i<=NF;i++){
			if ($i == var){
				a = (NF-4)/2;
				print $(NF-a-2),$(NF-a-1),$(NF-a-1+i)
			}
		}
    }' pasted.dat > $line.dat
    mv $line.dat Molec_vs_time/
    echo "Finished searching $line"

done < "$1"
rm pasted.dat
cp molectypes.dat Molec_vs_time/
