IMSI Catcher
============

Script bash automation
----------------------

```bash
#!/bin/bash
sudo su
echo "deb http://fr.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> sources.list
apt update
apt install gcc-4.9 g++-4.9 gcc-7 g++-7 gcc-10 g++-10
sed -i '$ d' /etc/apt/sources.list
apt update
apt install build-essential libgmp-dev libx11-6 libx11-dev flex libncurses5 libncurses5-dev libncursesw5 libpcsclite-dev zlib1g-dev libmpfr4 libmpc3 lemon aptitude libtinfo-dev libtool shtool autoconf git-core pkg-config make libmpfr-dev libmpc-dev libtalloc-dev libfftw3-dev libgnutls28-dev libssl1.0-dev libtool-bin libxml2-dev sofia-sip-bin libsofia-sip-ua-dev sofia-sip-bin libncursesw5-dev libncursesw5-dbg bison libgmp3-dev alsa-oss
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 49 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10
echo "deb http://fr.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse" >> sources.list
apt update
apt install gcc-5 g++-5
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50 --slave /usr/bin/g++ g++ /usr/bin/g++-5
sed -i '$ d' /etc/apt/sources.list
apt update
update-alternative --set gcc /usr/bin/gcc-4.9
apt remove texinfo
mkdir /opt/IMSI_Catcher
cd /opt/IMSI_Catcher
wget http://ftp.gnu.org/gnu/texinfo/texinfo-4.13.tar.gz
gzip -dc < texinfo-4.13.tar.gz | tar -xf -
cd texinfo-4.13
./configure
make
make install
git clone https://github.com/axilirator/gnu-arm-installer.git gnuarm
cd gnuarm
#Run the Scripts
./download.sh
./build.sh
export PATH=$PATH:/root/gnuarm/install/bin 
# Now you have cross-compiler ready you can build osmocom with your firmware
cd /opt/IMSI_Catcher
git clone git://git.osmocom.org/libosmocore.git
cd libosmocore
autoreconf -i
./configure
make
make install
ldconfig
cd /opt/IMSI_Catcher
git clone git://git.osmocom.org/libosmo-dsp.git
cd libosmo-dsp
autoreconf -i
./configure
make
make install
cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/osmocom-bb trx
cd trx
git checkout jolly/testing
cd src
sed -i -e  's/#CFLAGS += -DCONFIG_TX_ENABLE/CFLAGS += -DCONFIG_TX_ENABLE/g' target/firmware/Makefile
make HOST_layer23_CONFARGS=--enable-transceiver
cd /opt/IMSI_Catcher

apt install -y libortp-dev
git clone https://github.com/osmocom/libosmo-abis
cd /opt/IMSI_Cacher/libosmo-abis
autoreconf -fi && ./configure --disable-dahdi && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/libosmo-netif
cd /opt/IMSI_Catcher/libosmo-netif
autoreconf -fi && ./configure && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/openbsc
cd /opt/IMSI_Catcher/openbsc/openbsc
autoreconf -fi && ./configure --with-lms && make -j4 && make install && ldconfig

cd /opt/IMSI_Catcher
git clone https://github.com/osmocom/osmo-bts
cd /opt/IMSI_Catcher/osmo-bts
git checkout 1.1.0
autoreconf -fi && ./configure --enable-trx && make -j4 && make install && ldconfig

cd /lib/modules/$(uname -r)/build/certs
openssl req -new -x509 -newkey rsa:2048 -keyout signing_key.pem -outform DER -out signing_key.x509 -nodes -subj "/CN=Owner/"
apt install -y gcc-9 g++-9 gcc-7 g++-7 gcc-10 g++-10
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10
cd /opt/IMSI_Catcher
git clone https://github.com/isdn4linux/mISDN
cd /opt/IMSI_Catcher/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/hardware/mISDN
rm -Rf /lib/modules/$(uname -r)/kernel/drivers/isdn/mISDN/
wget https://raw.githubusercontent.com/bbaranoff/PImpMyPi/main/octvqe.patch
cp /boot/System.map-$(uname -r) /usr/src/linux-headers-$(uname -r)/System.map
ln -s /lib/modules/$(uname -r)/build /lib/modules/$(uname -r)/source
aclocal && automake --add-missing
./configure
patch -p0 < octvqe.patch
make modules
cp /opt/IMSI_Catcher/mISDN/standalone/drivers/isdn/mISDN/modules.order /usr/src/linux-headers-$(uname -r)
cp -rn /usr/lib/modules/$(uname -r)/. /usr/src/linux-headers-$(uname -r)
make modules_install
depmod -a

update-alternatives --set gcc /usr/bin/gcc-7

cd /opt/IMSI_Catcher
apt install bison flex -y
git clone https://github.com/isdn4linux/mISDNuser
cd /opt/IMSI_Catcher/mISDNuser
make
./configure
make
make install
ldconfig
cd example
./configure
make
make install
ldconfig

update-alternatives --set gcc /usr/bin/gcc-10

#Asterisk version (11.25.3) :
wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-11.25.3.tar.gz
tar zxvf asterisk-11.25.3.tar.gz
cd /opt/IMSI_Catcher/asterisk-11.25.3
apt install libncurses-dev libxml2-dev
./configure
make
make install
make config
ldconfig

git clone https://github.com/fairwaves/lcr
cd lcr
autoreconf -i
./configure --with-sip --with-gsm-bs --with-gsm-ms --with-asterisk
make
make install
ldconfig
cp chan_lcr.so /usr/lib/asterisk/modules/
apt-get install alsa-oss
modprobe snd-pcm
modprobe snd-mixer-oss
modprobe mISDN_core
modprobe mISDN_dsp

git clone https://github.com/bbaranoff/lcr_conf /etc/usr/local/lcr
```

Change /etc/asterisk/sip.conf with the following
```
[general]
bindport=5040
bindaddr=0.0.0.0
context=default
srvlookup=yes
defaultexpirey=1800
dtmfmode=auto
qualify=yes
register => 4XXXX5:49XXXXXXX51@diamondcard.us
nat=yes


 ; Add to your sip.conf
 ;
 ; Diamondcard.us termination
 [diamondcard]
 type=peer
 username=4XXXX5
 fromuser=4XXXX5
 secret=49XXXXXXX51
 host=sip.diamondcard.us
 disallow=all
 allow=alaw,ulaw
 fromdomain=sip.diamondcard.us 
```
according to your SIP registrar

Change now /etc/asterisk/extensions.conf by

```
[from-lcr]
include => default
 exten => _X.,1,Set(CALLERID(number)=0656565656)
 exten => _X.,2,Monitor(wav,myfilename2)
 exten => _X.,3,Dial(SIP/0033${EXTEN:1}@diamondcard)
 exten => _X.,4,Congestion 
 exten => _011.,1,Dial(LCR/ast/${EXTEN:3},60)
```


