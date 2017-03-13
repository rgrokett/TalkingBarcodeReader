#!/bin/bash

# CHANGE TO DB DIR
cd ../db

# RECREATE UPCdata.csv CSV FILE
#rm -f UPCdata.csv

if [ ! -f UPCdata.csv ]; then
    #gunzip *.gz
    ../bin/parseDB.py
    cat Grocery_UPC_Database.csv|cut -d',' -f2,5 >> UPCdata.csv
    sort -u -k1,1 -n -t, UPCdata.csv -o UPCdata.csv
    sed -i -- 's/\"//g' UPCdata.csv
fi

# CREATE DB WITH TABLE
rm -f UPCdata.db
sqlite3 UPCdata.db < UPCdata.sql

