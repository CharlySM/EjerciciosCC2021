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

 def addString(route, string)
   open(route, 'a') do |f|
     f << string
   end
 end

get '/' do
  aux=getJson("./estructura.json")
  @data=aux
  erb :index
end

post '/added' do
  string="{#{params[:equipo]}:{\"ganados\":#{params[:ganados]},\"empatados\":#{params[:empatados]},\"perdidos\":#{params[:perdidos]}}}"
  addString("./estructura.json",string)
  erb :index
end
