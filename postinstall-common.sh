#!/bin/sh

# Install docker if necessary
pacman -Q docker >> /dev/null 2>&1
if [[ "$?" != "0" ]]; then
    sudo pacman --noconfirm -Sy docker docker-compose
fi

# Configure Docker
sudo cp docker.socket /etc/systemd/system/docker.socket

sudo mkdir -p /etc/systemd/system/docker.service.d

if [[ -n "$ADVERTISE_IP" ]]; then 
    sudo cat > /etc/systemd/system/docker.service.d/docker.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd:// \
          --cluster-store=consul://${CONSUL_IP}:8500 \
          --cluster-advertise=${ADVERTISE_IP}:2375
          --label="containerslots=${CONTAINER_SLOTS:-3}"
EOF
fi

# Reload and restart docker
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker

sudo usermod -aG docker vagrant
