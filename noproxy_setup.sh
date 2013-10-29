#!/bin/sh -e

username=
password=

echo -n "Username : "
read username

echo -n "Password : "
stty -echo
read password
stty echo
echo

# replace usename and password variable values in py file
sed -e 's:"<username>":"'$username'":g;s:"<password>":"'$password'":g' noproxy.py > ./noproxy_tmp.py
# move to specific location
sudo mv ./noproxy_tmp.py /root/noproxy.py
# make it root only accessible
sudo chmod 700 /root/noproxy.py


# add entry to rc.local
sed -i s:"^exit 0":"python /root/noproxy.py \& \nexit 0": /etc/rc.local

exit 0
