echo "This script will download the PIP installer and run it."
echo "It requires root access, so you will be prompted for your password."
echo

curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py > /tmp/pip_installer.py 2>/dev/null
sudo python /tmp/pip_installer.py

sudo pip install -r pip_packages
