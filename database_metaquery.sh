#!/bin/sh
pswd=$1

mkdir metaquery
cd metaquery

python ../dbquery_basicfacts.py $pswd
python ../dbquery_chromdist.py $pswd #	Please note! np.median returns an average if given an even number of data
python ../dbquery_genesperperson.py $pswd
python ../dbquery_peoplepergene.py $pswd
python ../dbquery_cumulativenovelty.py $pswd


#dbquery_associativity.py
#dbquery_compareexpression.py
#




