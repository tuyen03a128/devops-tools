#!/usr/bin/env bash
# Exit on error
set -e

echo Install docker :: Begin
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "MacOS is not support at this time. Let try to install docker manually first"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Install
    if [ ! -e /usr/bin/docker ]; then
        echo Install docker :: Setup docker
        curl -sSL https://get.docker.com/ | sudo sh

        USER=`whoami`

        echo Install docker :: Add user $USER to docker group
        sudo usermod -aG docker $USER

        echo Install docker :: Install docker-compose
        sudo pip install docker-compose

        echo Install docker :: Restart docker
        sudo service docker restart
    fi
fi

echo 'Install docker :: Completed !!!'

echo Create alias for docker
cat << EOF | sudo tee /usr/bin/d
#!/usr/bin/env bash

docker "\$@"
EOF

sudo chmod +x /usr/bin/d

echo Create alias for docker exec -ti
cat << EOF | sudo tee /usr/bin/dsh
#!/usr/bin/env bash

docker exec -ti "\$1" bash
EOF
sudo chmod +x /usr/bin/dsh

echo Create alias for docker compose
cat << EOF | sudo tee /usr/bin/dc
#!/usr/bin/env bash

docker-compose "\$@"
EOF

sudo chmod +x /usr/bin/dc

echo Done
