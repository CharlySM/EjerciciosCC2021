require 'sinatra'
require 'json'
require 'io/console'

set :bind, "0.0.0.0"
set :port, 80

@data=nil

def getJson(file)
   map={}
   if File.file?(file)
     map=IO.read(file)
   end
   return map
 end

get '/' do
  aux=getJson("./estructura.json")
  puts aux
  @data=aux
  erb :index
end
