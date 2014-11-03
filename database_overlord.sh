#!/bin/sh
#############################################
###	Build the database
python database_constructor.py
python database_uploader.py
#		DATABASE LOOKBACK
#python database_lookback.py
#		Database antifinder
#python database_antifind.py
#		Compare to chimp, gorilla transcriptomes
#python database_checkprimates.py
#		Get coverage data
#python database_coveragecalc.py
#		add variation info to DB
#python database_vcf_upload.py

#############################################
###	Do some analytics
python database_metaquery.py
#############################################
