# TalkingBarcodeReader
Raspberry Pi Zero Text-to-Speech USB Laser Bar Code Reader

##Overview
My mom is unable to read labels on grocery items anymore, so I went looking for solutions. After seeing that bar code readers for the blind run many hundreds of dollars, I wanted to see what could be done using a Raspberry Pi and a USB Barcode reader.  

I tried a camera based version of bar code reader, but lighting and camera position caused reliability issues for someone unable to see clearly. So I switched to a USB Laser bar code reader, especially since they are now available for under $30 and the Raspbian Jessie supports them right out of the box.

The idea was to scan an item and have the Raspberry query an internal database of UPC codes and then speak the product description using text-to-speech.  

In order to make the unit as small as possible, I wanted to use a Raspberry Pi Zero. I also didn’t want it to be dependent on Internet connectivity, so the database and the text-to-speech would be local. I also wanted to run the unit off battery power as well.

See [[TalkingBarcodeReader.pdf](TalkingBarcodeReader.pdf) for details.

