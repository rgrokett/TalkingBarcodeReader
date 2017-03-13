#!/bin/bash
# git clone https://{GITHUB}/TalkingBarcodeReader
# cd ./TalkingBarcodeReader
# ./install.sh

# INSTALLS ALL NECESSARY FILES
# OK TO RUN MORE THAN ONCE

# INSTALL PACKAGES AS NEEDED
echo "INSTALLING DEPENDENCIES..."
sudo apt-get -y install lighttpd
sudo apt-get -y install sqlite3
sudo apt-get -y install flite
sudo apt-get -y install php5 php5-common php5-cgi php5-sqlite

#Configure webserver options for PHP
echo "CONFIGURING WEB SERVER..."
sudo lighty-enable-mod fastcgi
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload 

# INSTALL BARCODE FILES
echo "INSTALLING BARCODE FILES..."
sudo cp -rp ./upc /var/www/html/

#Set permissions & reboot
sudo chown -R www-data:www-data /var/www
sudo chmod -R 775 /var/www
sudo usermod -a -G www-data pi

# APPEND BARCODE START TO /etc/rc.local
echo "--> Edit /etc/rc.local and append following before exit 0:"
echo "sudo /var/www/html/upc/bin/run.sh"
echo

echo "FINISHED INSTALL."
echo "PLEASE POWERDOWN, PLUG IN USB BARCODE READER AND REBOOT."
echo "See docs for usage."
echo "RUN:"
echo "sudo shutdown now"

