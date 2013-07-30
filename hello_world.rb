# hello_world.rb
require 'rack'
require 'rack/server'

class HelloWorldApp
  def self.call(env)
    out = env.sort.reduce([]) do |x, y| 
      x += [ "  #{y[0]} => #{y[1]}\n" ] 
    end
    [ "200", { 'Content-Type' => 'text/plain' }, out ]
  end
end

Rack::Server.start :app => HelloWorldApp, :server => 'thin'
