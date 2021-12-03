import os
from itertools import islice
file_path = os.path.expanduser('~/amazon_reviews_us_Books_v1_02.tsv')
with open(file_path) as f:
        numbers = []
        for line in islice(f, 1, None): #skip the header row
                numbers.append(int(line.split("\t")[8]))
        numbers.sort()
count = len(numbers)
max_num = max(numbers)
min_num = min(numbers)
sum_of_nums = sum(numbers)
avg = sum_of_nums/float(count)
print("min %s max %s avg %s" % (min_num, max_num, avg ))

