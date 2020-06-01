import argparse
import gc
from numpy import array
from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument("-b", "--bedin", help="bed file to rename")
parser.add_argument("-u", "--unclumped", help="intervals not yet stitched together")
parser.add_argument("-o", "--bedout", help="renamed bed file")
parser.add_argument("-v", "--verbosity", help="reporting verbosity", type = int, choices = [0,1,2,3], default=0)

#parser.add_argument("-m", "--merged_intervals", help="merged intervals from RNA-Seq reads", default=None)
args = parser.parse_args()




#footprint2read =open("HG00101.vs_hg38.mapspliceRaw.footprint2read.informative.list","r")
#footprint2read =open("awk.test.live","r")
footprint2read = open(args.unclumped, "r")

interval_dict = {}

startTime= datetime.now() 
if args.verbosity > 0:
	print("reading in the unstitched intervals....")
for lion in footprint2read.readlines():

	lion = lion.split("\n")[0].split("\t")
	if lion[0] in interval_dict.keys():
		interval_dict[lion[0]].append(lion[1])
	else:
		interval_dict[lion[0]] = [lion[1]]

subclusters = list(interval_dict.values())
subclusters = array(subclusters)

del(interval_dict)
gc.collect()

unstitched_readTime=datetime.now()-startTime

if args.verbosity > 0:
	print("reading in the unstitched intervals.... DONE! {}".format(unstitched_readTime))



if args.verbosity > 0:
	print("boiling down the subclusters int clusters... ")
cluster_startTime= datetime.now() 
clusters=[]
while len(subclusters) >0 :
	subcluster_startTime= datetime.now()
	clust = set(subclusters[0])
	subclusters = subclusters[1:]
	#pop the first subcluster
	popz = []

	if args.verbosity > 0:
		print("popped the first remaining, scanning the rest for nonempty intersections... ")
	for i in range(0, len(subclusters)):
		lenny = len(subclusters)
		if len(clust.intersection(subclusters[i])) > 0 : #does this subcluster connect to the one thats accumulating?
			clust = clust.union( subclusters[i] ) #merge them
			popz.append(i) #mark it for removal
			if args.verbosity > 2:
				print( "checked %s of %s" %tuple([i,lenny]) ) #move on to the next


	clusters.append(clust)
	try: # remove all the subclusters just merged 
		pop_array = array([True]*len(subclusters))
		pop_array[popz] = False
		subclusters = subclusters[pop_array]
		if args.verbosity > 1:
			print("popping out %s subclusters; %s to go! {}".format(datetime.now()-subcluster_startTime) %tuple([len(popz)+1, len(subclusters)]))
	except IndexError: # unless that was the last one, in case move on with your life
		pass

cluster_mergeTime = datetime.now()-cluster_startTime
if args.verbosity > 0:
	print("boiling down the subclusters into clusters... DONE! {}".format(cluster_mergeTime))


if args.verbosity > 0:
	print("Re-merging covert intersects between extant clusters... ")
doubleCheck_startTime= datetime.now() 

# #gotta scan the clusters due to a pathology : [A, D], [B,C ], [C,D] will merge to [A,C,D] and [B,C] .... so when you arrive at [B,C] on the second runthru, look at extant clusters to merge with
def scan_for_intersects(clust_in):
	dict_out = {}
	for i in range(0, len(clust_in)):
		dict_out[i] = []
		for j in range(i+1,len(clust_in)):
			if len(clust_in[i].intersection(clust_in[j])) > 0:
				dict_out[i].append(j)
		if len(dict_out[i])==0:
			dict_out.pop(i)
	return(dict_out)



clusters = array(clusters)

pass_count = 0
inter_dict = scan_for_intersects(clusters)
while len(inter_dict) > 0:
	pass_count +=1
	if args.verbosity > 1:
		print("checking for covert intersects, pass %s" % tuple([pass_count]))
	qui_list = list(inter_dict.keys())
	qui_list.reverse() # go back to front
	for q in qui_list:
		for f in inter_dict[q]:
			clusters[q] = clusters[q].union(clusters[f])

	popz=list(set([item for sublist in inter_dict.values() for item in sublist]))
	pop_array = array([True]*len(clusters))
	pop_array[popz] = False
	clusters=clusters[pop_array]
	inter_dict = scan_for_intersects(clusters)
doubleCheck_Time = datetime.now()-doubleCheck_startTime
if args.verbosity > 0:
	print("Re-merging covert intersects between extant clusters... DONE! in %s passes {}".format(cluster_mergeTime) %tuple([pass_count]))



unpack_startTime= datetime.now() 
if args.verbosity > 0:
	print("unpacking the clumped clusters.....")
clust_dict = {}
for i in range(0,len(clusters)):
	for subclust in clusters[i]:
		clust_dict[subclust] = "clump_%s"%tuple([i])
print("clusters named")


unpack_Time= unpack_startTime - datetime.now() 
if args.verbosity > 0:
	print("unpacking the clumped clusters..... DONE! {}".format(unpack_Time))



fitted_sheets = []

unmade_bed = open(args.bedin, "r")

for lion in unmade_bed.readlines():
	lion_splut = lion.split("\n")[0].split("\t")
	try:
		lion_splut[3] = clust_dict.pop(lion_splut[3])
	except KeyError:
		pass
	fitted_sheets.append(lion_splut)
unmade_bed.close()

mattress = open(args.bedout, "w")

for sheet in fitted_sheets:
	mattress.write("%s\t%s\t%s\t%s\n" %tuple(sheet))

mattress.close()
print("....done.")









	# #gotta scan the clusters due to a pathology : [A, D], [B,C ], [C,D] will merge to [A,C,D] and [B,C] .... so when you arrive at [B,C] on the second runthru, look at extant clusters to merge with
	# merged = False # has the cluster been merged to a preexisting one?
	# if args.verbosity > 0:
	# 	print("scanning extant clusters for overlap....")
	# for i in range(0,len(clusters)):
	# 	if len(clust.intersection(clusters[i])) >0 :
	# 		clusters[i] = clust.union(clusters[i])
	# 		merged = True
	# 		if args.verbosity > 1:
	# 			print("joining subcluster to extant cluster %s...." % tuple([i])) 
	# 		break
	# if not merged: # if you didn't merge it to an extant cluster, add it to the cluster list
	# #otherwise, add it to clusters
	# 	if args.verbosity > 1:
	# 		print("no extant cluster found to merge, appending merged subclusters to cluster list!")






