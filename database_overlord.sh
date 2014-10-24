#!/bin/sh
#############################################
###	Build the database
python database_constructor.py
python database_uploader.py
python database_vcf_upload.py
#############################################
###	Do some analytics
python database_metaquery.py
#############################################
