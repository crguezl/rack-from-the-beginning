# hello_world.rb
require 'rack'
require 'rack/server'

class ParamsParser
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    env['chuchu'] = request.params
    #app.call env
    env
  end
end

class HelloWorldApp
  def self.call(env)
    parser = ParamsParser.new self
    env = parser.call env
    # env['chuchu'] is now set to a hash for all the input paramters
    for k in env.keys do
      puts "#{k} => #{env[k]}" 
    end

    [200, {}, env['chuchu']] 
  end
end

Rack::Server.start :app => HelloWorldApp, :server => 'thin'
