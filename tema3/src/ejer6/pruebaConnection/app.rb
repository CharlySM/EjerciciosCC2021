require 'sinatra'
require "httparty"

get '/' do
  @results = HTTParty.get('http://localhost:8000/echo')
  print(@results)
  erb :index
end
