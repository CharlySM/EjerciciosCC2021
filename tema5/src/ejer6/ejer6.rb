require 'etcdv3'

conn = Etcdv3.new(endpoints: 'http://127.0.0.1:2379')
puts "port: #{conn.get("PortApp").kvs.first.value}"
puts "host: #{conn.get("HostApp").kvs.first.value}"
