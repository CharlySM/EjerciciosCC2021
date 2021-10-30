require './index.rb'
require 'minitest/autorun'
require 'rack/test'

class RoutesTest < Minitest::Test

  include Rack::Test::Methods

  $expectedPost="<!DOCTYPE html>\r
<html>\r
\t<head>\r
\t\t<!--<link rel=styleSheet href=\"css/styles.css\" type=\"text/css\">-->\r
    <meta charset=\"utf-8\">\r
\t\t<title>\r
\t\t\t\tApp ejercicio 1\r
\t\t\t</title>\r
\t</head>\r
  <body>\r
    <header>\r
      <h1>App ejercicio 1</h1>\r
    </header>\r
\r
    <p></p>\r
\r
    <form class=\"\" action=\"/added\" method=\"post\">\r
\t\t\t\t\t<input type=\"text\" name=\"equipo\" value=\"Granada\">\r
\t\t\t\t\t<input name=\"empatados\" type=\"hidden\" value=\"3\">\r
          <input name=\"ganados\" type=\"hidden\" value=\"12\">\r
          <input name=\"perdidos\" type=\"hidden\" value=\"2\">\r
\t\t\t\t\t<input type=\"submit\" name=\"added\" value=\"added\">\r
\t\t</form>\r
\r
  </body>\r
</html>\r
"

$expectedGet="<!DOCTYPE html>\r
<html>\r
\t<head>\r
\t\t<!--<link rel=styleSheet href=\"css/styles.css\" type=\"text/css\">-->\r
    <meta charset=\"utf-8\">\r
\t\t<title>\r
\t\t\t\tApp ejercicio 1\r
\t\t\t</title>\r
\t</head>\r
  <body>\r
    <header>\r
      <h1>App ejercicio 1</h1>\r
    </header>\r
\r
    <p>{Granada:{\"ganados\":12,\"empatados\":3,\"perdidos\":2}}</p>\r
\r
    <form class=\"\" action=\"/added\" method=\"post\">\r
\t\t\t\t\t<input type=\"text\" name=\"equipo\" value=\"Granada\">\r
\t\t\t\t\t<input name=\"empatados\" type=\"hidden\" value=\"3\">\r
          <input name=\"ganados\" type=\"hidden\" value=\"12\">\r
          <input name=\"perdidos\" type=\"hidden\" value=\"2\">\r
\t\t\t\t\t<input type=\"submit\" name=\"added\" value=\"added\">\r
\t\t</form>\r
\r
  </body>\r
</html>\r
"

  def app
      Sinatra::Application
  end

  def test_my_default

   get '/'

   assert_equal $expectedGet, last_response.body
 end

 def test_post
   File.open("./estructura.json", "w") do |f|
     f.write ""
   end
    response = post '/added', equipo: 'Granada', ganados: 12, empatados: 3, perdidos: 2
    assert_equal $expectedPost, last_response.body
  end



end
