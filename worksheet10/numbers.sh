#!/bin/bash
awk -F "\t" '
{
	if (NR == 2)
	{
		count=1;
		sum=$9;
		min=$9;
		max=$9;
	}
	if (NR > 2)
	{
		count+=1;
		sum+=$9;
		if ($9 < min) min=$9;
		if ($9 > max) max=$9;
	}
}
END { printf "min %s max %s avg %f\n", min, max, sum / count; }' ~/amazon_reviews_us_Books_v1_02.tsv
