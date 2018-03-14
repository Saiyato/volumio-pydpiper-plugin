#!/bin/bash
# Fetch the latest release of pydPiper
wget https://github.com/dhrone/pydPiper/archive/v0.3-alpha.tar.gz
#wget $(curl -s https://api.github.com/repos/dhrone/pydPiper/releases/latest | grep 'tar' | cut -d\" -f4) -P /home/volumio/pydPiper

mkdir /home/volumio/pydPiper
tar zxvf v0.3-alpha.tar.gz -C /home/volumio/pydPiper/ --strip-components=1
rm *.tar.gz

cd /home/volumio/pydPiper
sh ./install.sh

wget -O /etc/systemd/system/pydpiper.service https://raw.githubusercontent.com/Saiyato/volumio-pydpiper-plugin/master/unit/pydpiper.service
systemctl daemon-reload

# timedatectl list-timezones