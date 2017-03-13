#!/bin/bash

DIR="/var/www/html/upc/bin"

cd $DIR
sudo rm -f nohup.out
sudo nohup python $DIR/barcode.py &

