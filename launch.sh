#!/bin/bash

cd $HOME

# Form Consul Cluster
ps -C consul
retval=$?
if [ $retval -eq 0 ]; then
  sudo killall consul
fi
sudo cp /vagrant/consul.hcl /etc/consul.d/server.hcl
sudo nohup consul agent --config-file /etc/consul.d/server.hcl &>$HOME/consul.log &

# Form Nomad Cluster
ps -C nomad
retval=$?
if [ $retval -eq 0 ]; then
  sudo killall nomad
fi
sudo cp /vagrant/nomad.hcl /etc/nomad.d/server.hcl
sudo nohup nomad agent -config /etc/nomad.d/server.hcl &>$HOME/nomad.log &