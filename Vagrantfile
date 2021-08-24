# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box                   = "bento/ubuntu-20.04"
	config.hostmanager.enabled 		= true
	config.hostmanager.manage_host 	= true
	config.hostmanager.manage_guest = true
	config.vm.provision "docker"

    (1..3).each do |i|
        config.vm.define "nomad0#{i}" do |node|
            node.vm.hostname = "nomad0#{i}"
            node.vm.network "private_network", ip: "192.168.99.#{i+100}"
            node.vm.provider :virtualbox do |v|
                v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                v.customize ["modifyvm", :id, "--memory", 8000]
                v.customize ["modifyvm", :id, "--name", "nomad0#{i}"]
            end
            if i == 1
                # Expose the nomad ports
                node.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true
            end
            node.vm.provision "shell", path: "setup.sh"
        end
    end
end
