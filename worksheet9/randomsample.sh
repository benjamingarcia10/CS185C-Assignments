#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Invalid command usage: randomsample.sh x fileinput";
	exit 1;
fi

if (( $1 <= 0 || $1 >= 100 )); then
	echo "Percentage must be between 0 and 100 (not inclusive)";
	exit 1;
fi

if [ ! -f $2 ]; then
	echo "Invalid file";
	exit 1;
fi

lineCount=`wc -l $2 | cut -d " " -f 1`
linesToOutput=$(( $lineCount * $1/100 ))
echo "Line count: $lineCount"
echo "Lines to output: $linesToOutput"

linesOutputted=0
while [ $linesOutputted -lt $linesToOutput ]; do
	lineNumber=$(( $RANDOM % (lineCount+1) ))
	line=`sed -n ${lineNumber}p $2`
	echo $line
	((linesOutputted++))
done
