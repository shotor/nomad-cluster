# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box                   = "generic/ubuntu2004"
	config.vm.provision             "docker"
    # config.vm.network.autostart     = true

    (1..3).each do |i|
        config.vm.define "nomad0#{i}" do |node|
            node.vm.hostname = "nomad0#{i}"

            node.vm.network :private_network,
                            libvirt__network_name: "private_network",
                            libvirt__host_ip: '192.168.99.#{i+100}'

            config.vm.provider :libvirt do |libvirt|
                libvirt.memory = 8000
            end
            # if i == 1
                # Expose the nomad ports
                # node.vm.network "forwarded_port", guest: 4646, host: 4646, auto_correct: true
            # end
            node.vm.provision "shell", path: "setup.sh"
        end
    end
end
