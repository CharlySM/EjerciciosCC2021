require 'diplomat'

port = Diplomat::Kv.get('puertoConsul')
host = Diplomat::Kv.get('hostConsul')

puts "port: #{port}"
puts "host: #{host}"
