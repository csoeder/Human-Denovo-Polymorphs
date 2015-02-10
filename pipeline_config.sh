#!/bin/sh

###############################################################
# paths to various folders	###################################
DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
###############################################################
# define the delay for the top-level submission step ##########
#	see metapipe.sh ###########################################
SUBMISSION_DELAY=1200	# 1200 seconds between submits ~ 3 per hour ~ 462 per week
###############################################################
# bundle parameters for the accumulator #######################
#	see aligned_fork ##########################################
BATCH_SIZE=300 #There are 300 datumz processed per bundle
WAIT_TIME=30 #	Wait 30 seconds before submitting next bundle
COUNTER=0 #		Nothing in the present bundle
###############################################################

