{
	#!/bin/bash
	# $1 = reviewID.txt file
	# $2 = tweets file
	
	if [[ $# -lt 2 ]] ; then
		echo "Missing arguments: command usage ./compare.sh reviewFile tweetsFile"
		exit 1
	fi
	
	if [[ ! -f tweetbodies.txt ]]; then
		cat $2 | cut -d ',' -f 6- | sed 's/"//g' > tweetbodies.txt
	fi
	
	reviewContent=$(cat "$1")
	lineCount=`wc -l tweetbodies.txt | cut -d " " -f 1`
	
	lineNumber=1
	until [[ $lineNumber -gt $lineCount ]]
	do
		line=`sed "${lineNumber}q;d" tweetbodies.txt`
		commonWordsCount=`comm -12 <(echo "$reviewContent" | tr " " "\n" | sed '/^$/d' | sort) <(echo "$line" | tr " " "\n" | sed '/^$/d' | sort) | wc -l`
		if [[ $commonWordsCount -ge 2 ]] ; then
			# echo "Common words for line ${lineNumber} is ${commonWordsCount}"
			echo $line >> $1
		fi
		((lineNumber++))
	done
	echo "Completed $1"
}
