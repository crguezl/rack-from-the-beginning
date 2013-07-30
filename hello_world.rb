# hello_world.rb
require 'rack'
require 'rack/server'

class HelloWorldApp
  def initialize(app)
    @app = app
  end

#  def self.call(env)
#    # Rack::Request is simply a proxy for the env hash. 
#    # The underlying env hash is modified 
#    request = Rack::Request.new env
#
#    puts "DEFAULT_PORTS = #{Rack::Request::DEFAULT_PORTS}"
#    puts "request.get? = #{request.get?}"
#    # contains the union of GET and POST params
#    puts "request.params = #{request.params.inspect}"
#    # requested with AJAX
#    puts "request.xhr? = #{request.xhr?.inspect}"
#    # the incoming request IO stream
#    puts "request.body = #{request.body.inspect}" 
#    # cookies
#    puts "request.cookies = #{request.cookies.inspect}" 
#    # path 
#    puts "request.fullpath = #{request.fullpath.inspect}" 
#    # url 
#    puts "request.url = #{request.url.inspect}" 
#    # ip
#    puts "request.ip = #{request.ip.inspect}" 
#    # port
#    puts "request.port = #{request.port.inspect}" 
#    puts "GET() = #{request.GET()}"
#
#    if request.params['message']
#      [200, {}, request.params['message']]
#    else
#      [200, {}, 'Say something to me!']
#    end
#  end

  # Rack::Response is an abstraction around 
  # generating response triplets. It simplifies access to 
  # headers, cookies, and the body
  def self.call(env)
    response = Rack::Response.new
    response.write 'Hello World' # write some content to the body
    #response.body = ['Hello World'] # or set it directly
    response['X-Custom-Header'] = 'foo'
    response.set_cookie 'bar', 'baz'
    response.status = 202
    response.write("\nHola Mundo!\n")

    puts response.inspect
    response.finish # return the generated triplet
  end

end


Rack::Server.start :app => HelloWorldApp, :server => 'thin'
