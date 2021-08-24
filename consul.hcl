data_dir = "/tmp/consul-server"

server           = true
bootstrap_expect = 3
advertise_addr   = "{{ GetInterfaceIP `eth1` }}"
client_addr      = "0.0.0.0"
ui               = true
datacenter       = "the-hague"
retry_join       = ["192.168.99.101", "192.168.99.102", "192.168.99.103"]