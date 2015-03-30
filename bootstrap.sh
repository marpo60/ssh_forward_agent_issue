#!/bin/bash

echo "Provisioning..."

echo "Adding users..."
adduser alice --gecos "" --disabled-password

sudo -u alice -H sh -c "mkdir ~/.ssh; cat /vagrant/alice_id_rsa.pub >>  ~/.ssh/authorized_keys"
echo "alice:alice123" | chpasswd
sudo usermod -aG sudo alice

if [ "$1" == "web" ] || [ "$1" == "worker" ]; then
  adduser eve   --gecos "" --disabled-password

  sudo -u eve -H sh -c "mkdir ~/.ssh; cat /vagrant/eve_id_rsa.pub >>  ~/.ssh/authorized_keys"
  echo "eve:eve123" | chpasswd
  sudo usermod -aG sudo eve
fi

sudo /usr/sbin/sshd -f /vagrant/${1}_sshd_config
