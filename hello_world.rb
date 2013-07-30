# hello_world.rb
require 'rack'
require 'rack/server'

class HelloWorld
  def response
    [200, {}, '<h1>Hello World</h1>']
  end
end

class HelloWorldApp
  def self.call(env)
    HelloWorld.new.response
  end
end

Rack::Server.start :app => HelloWorldApp
