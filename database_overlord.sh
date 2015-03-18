#!/bin/sh
pswd=$1


#		DATABASE BLACKLIST -  Mask any known imposters
#sh database_blacklist.sh	# <-------	Appears functional!


#############################################
###	Build the database
python database_constructor.py $pswd
python database_uploader.py $pswd

#		collect first-order consolidated information from database
#		store it as BED files, FASTAs, etc
#python database_pullBioinfo.py



#		DATABASE LOOKBACK
#python database_lookback.py

#		Database antifinder		<----	FUNCTIONAL!
#python database_antifinder.py $pswd	<------- BUT TIME CONSUMING; SUPPRESSED FOR NOW!

#		Compare to chimp, gorilla transcriptomes
#python database_checkprimates.py 	<<< still needs help?
#		Get coverage data
#python database_coverage.py 			???
#python database_coveragecalc.py 		???

#		add variation info to DB
python database_VCFupload.py   #<------FUNCTIONAL! would be good to add a primary key field referencing the location items each variants occur within


#############################################
###	Do some analytics
sh database_metaquery.sh $pswd
#############################################
