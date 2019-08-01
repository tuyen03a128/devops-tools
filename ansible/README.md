#About
This project to setup ansible

#Setup
The following setup commands is tested in Ubuntu 16.04.5 LTS (Xenial) 
```
lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 16.04.5 LTS
Release:	16.04
Codename:	xenial
```
**Using Python 3**

**Install pip3 **
```
curl -sS https://bootstrap.pypa.io/get-pip.py >>setup.py
sudo python3 setup.py
```

Install virtualenv
```
sudo pip3 install virtualenv
```
Notes: Create the environment while you specify the version of the Python we wish to use. 
```
which python3
```
/usr/bin/python3 

Install ansible

```
virtualenv -p /usr/bin/python3  ~/devops
~/devops/bin/pip3 install --upgrade setuptools ansible
cat << EOF | tee ~/devops/bin/ap
#!/usr/bin/env bash

$HOME/devops/bin/ansible-playbook "\$@"
EOF

chmod +x ~/devops/bin/ap 
```

