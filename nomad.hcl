data_dir = "/tmp/nomad-server"

server {
  enabled          = true
  bootstrap_expect = 3
  job_gc_threshold = "2m"
}

datacenter = "the-hague"

region = "eu-west"

advertise {
  http = "{{ GetInterfaceIP `eth1` }}"
  rpc  = "{{ GetInterfaceIP `eth1` }}"
  serf = "{{ GetInterfaceIP `eth1` }}"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

client {
  enabled           = true
  network_interface = "eth1"
  servers           = ["192.168.99.101", "192.168.99.102", "192.168.99.103"]
}