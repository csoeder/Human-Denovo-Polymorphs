##################

import matplotlib.pyplot as plt
import numpy as np
import csv

timestamps = {}

with open('accumulator_timelord.log', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	raw_dates = []
	total_load = []
	run_load = []
	pend_load = []
	for row in spamreader:
		if row[1] in timestamps.keys():
			timestamps[row[1]].append(60*int(row[2].split('m')[0])+int(row[2].split('m')[1][:-1]))
		else:
			timestamps[row[1]]=[row[2]]



bar_labels = []
bar_values = []
bar_ranges = []
total_time = 0.0
subtime = []

for key in timestamps.keys():
	bar_labels.append(key)
	bar_values.append(np.mean(timestamps[key]))
	bar_ranges.append(np.std(timestamps[key]))
	total_time += sum(timestamps[key])
	subtime.append(sum(timestamps[key]))


ax = plt.subplot(211)

tix = np.arange(len(timestamps.keys()))
rects1 = ax.bar(tix, bar_values, 0.9, color='k', alpha=0.2, yerr=bar_ranges)
ax.set_ylabel('Time (seconds +/- 1 sigma)')
ax.set_title('Time Spent on Accumulator Subprocesses')
ax.set_xticks(tix+0.5)
ax.set_xticklabels( tuple(bar_labels) )

ax =plt.subplot(212)

pie = ax.pie(subtime, labels = tuple(bar_labels), shadow=True, autopct='%1.1f%%)
ax.set_title("Total Accumulation Time, by Subprocess")


plt.savefig("Accumulator_Reportback.png")


