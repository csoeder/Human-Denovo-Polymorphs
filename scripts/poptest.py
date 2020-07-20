from random import choice, sample
from numpy import array

x = list(range(0,100000))


def lister():
	x = list(range(0,100000))

	y = sample(x, 10000) 
	y.sort()
	y.reverse()

	for pop in y:
		x.pop(pop)


def arrayer():
	x = list(range(0,100000))

	y=[]
	for i in range(0, len(x)):
		y.append(choice([True, False]))
	x = array(x)
	x = x[y]

#lister()
arrayer()
