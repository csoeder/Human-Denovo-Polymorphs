#!/bin/sh
pswd=$1

mkdir metaquery
cd metaquery

python ../dbquery_basicfacts.py $pswd



#dbquery_associativity.py
#dbquery_chromdist.py
#dbquery_compareexpression.py
#dbquery_cumulativenovelty.py
#dbquery_genesperperson.py
#dbquery_peoplepergene.py




