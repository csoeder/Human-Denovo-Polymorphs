import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
import csv
import numpy as np
from matplotlib.dates import HourLocator, YearLocator, MonthLocator, DateFormatter, AutoDateLocator
import matplotlib.dates as mdates
import datetime
import calendar

moon_dict = {v: k for k,v in enumerate(calendar.month_abbr)}

with open('lsf.log', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	raw_dates = []
	total_load = []
	run_load = []
	pend_load = []
	for row in spamreader:
		date = row[0]
		total_jobs = row[1]
		running_jobs = row[2]
		pending_jobs = row[3]
		raw_dates.append(datetime.datetime( int(date.split(' ')[-1]), moon_dict[ date.split(' ')[1]], int(date.split(' ')[2]), int(date.split(' ')[3].split(':')[0]), int(date.split(' ')[3].split(':')[1]), int(date.split(' ')[3].split(':')[2])))
		total_load.append(int(total_jobs))
		run_load.append(int(running_jobs))
		pend_load.append(int(pending_jobs))


dates = matplotlib.dates.date2num(raw_dates)


fig, ax = plt.subplots()


ax.xaxis.set_minor_locator(HourLocator(interval=2))
ax.xaxis.set_minor_formatter(mdates.DateFormatter('%H:%S'))
ax.xaxis.set_major_locator(mdates.DayLocator(interval=2))
ax.xaxis.set_major_formatter(mdates.DateFormatter('%m/%d'))

plt.plot(raw_dates, run_load, 'go-')
plt.plot(raw_dates, np.array(run_load)+np.array(pend_load), 'bo-')
plt.plot(raw_dates, total_load, 'ko-')
plt.fill_between(raw_dates, 0,run_load, color='green', alpha=0.25)
plt.fill_between(raw_dates, run_load, np.array(run_load)+np.array(pend_load), color='blue', alpha=0.25)
plt.fill_between(raw_dates, np.array(run_load)+np.array(pend_load), total_load, color='red')
fig.autofmt_xdate()
plt.xticks(rotation=45)

plt.savefig('LSF_load.png')
plt.show()



