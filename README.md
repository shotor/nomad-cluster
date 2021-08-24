# Nomad Cluster

Building a production ready Nomad cluster

## Current State

Vagrant file that sets up 3 dev VMS running Nomad and Consul and connected as cluster. Still manual step needed:

```sh
vagrant up
vagrant ssh nomad0{n}
sh /vagrant/launch.sh
```

## Prior Work

- <https://github.com/aedifex/nomad-vagrant-cluster>
- <https://github.com/discoposse/nomad-vagrant-lab>

## Todo

- [x] Dev environments using Vagrant
- [ ] Replicated Web Service in test namespace
- [ ] Ingress Controller
- [ ] Service mesh
- [ ] Multiple leaders
- [ ] Loadbalancer VM
- [ ] Wireguard into cluster
- [ ] Firewall - external only accessible via loadbalancer
- [ ] ...
- [ ] Prod Ready!
