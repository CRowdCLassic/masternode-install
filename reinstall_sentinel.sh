#!/bin/bash

echo -e "Quick cleanup then reinstall"
rm -rf ~/sentinelLinux > /dev/null 2>&1
rm ~/sentinel.log > /dev/null 2>&1


apt-get -y install python-virtualenv virtualenv >/dev/null 2>&1
cd
git clone https://github.com/CRowdCLassic/sentinelLinux.git >/dev/null 2>&1
cd ~/sentinelLinux
export LC_ALL=C >/dev/null 2>&1
virtualenv ./venv >/dev/null 2>&1
./venv/bin/pip install -r requirements.txt >/dev/null 2>&1


mv ~/sentinelLinux/sentinel.conf ~/sentinelLinux/sentinel.OLD
touch ~/sentinelLinux/sentinel.conf >/dev/null 2>&1
cat << EOF > ~/sentinelLinux/sentinel.conf
# specify path to dash.conf or leave blank
# default is the same as DashCore
dash_conf=~/.crowdclassiccore/crowdclassic.conf
#crowd_conf=/root/.crowdclassiccore/crowdclassic.conf

# valid options are mainnet, testnet (default=mainnet)
network=mainnet
#network=testnet

# database connection details
db_name=database/sentinel.db
db_driver=sqlite

EOF

echo
echo
echo "Waiting 60s then will show debug"
sleep 60
SENTINEL_DEBUG=1 ./venv/bin/python bin/sentinel.py
