import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt
import csv
import numpy as np
from matplotlib.dates import YearLocator, MonthLocator, DateFormatter
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

plot_date(dates, full_load)
plt.show()