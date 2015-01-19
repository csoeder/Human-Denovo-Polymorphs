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
	full_load = []
	for row in spamreader:
		date = row[0]
		total_jobs = row[1]
		running_jobs = row[2]
		pending_jobs = row[3]
		raw_dates.append(datetime.datetime( int(date.split(' ')[-1]), moon_dict[ date.split(' ')[1]], int(date.split(' ')[2]), int(date.split(' ')[3].split(':')[0]), int(date.split(' ')[3].split(':')[1]), int(date.split(' ')[3].split(':')[2])))
		full_load.append(int(total_jobs))

dates = matplotlib.dates.date2num(raw_dates)

print len(dates), dates
print len(full_load), full_load

fig, ax = plt.subplots()


ax.xaxis.set_minor_locator(HourLocator(interval=2))
ax.xaxis.set_minor_formatter(mdates.DateFormatter('%H:%S'))
ax.xaxis.set_major_locator(mdates.DayLocator(interval=2))
ax.xaxis.set_major_formatter(mdates.DateFormatter('%m/%d'))

plt.plot(raw_dates, full_load)
fig.autofmt_xdate()
plt.xticks(rotation=45)

plt.savefig('LSF_load.png')
plt.show()










#fig, ax = plt.plot_date(dates, full_load, drawstyle="steps", 
#linestyle=``'-'``)

#loc = HourLocator(byhour=range(24), interval=1)

#fig, ax = plt.subplots()
#ax.plot_date(dates, full_load)
#plt.plot(raw_dates, full_load)

#ax.xaxis.set_major_locator( loc )
#plt.xticks(rotation=45)
#fig.autofmt_xdate()
#plt.savefig('LSF_load.png')
