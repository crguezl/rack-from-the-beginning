# hello_world.rb
require 'rack'
require 'rack/server'

class EnsureJsonResponse
  def initialize(app = nil)
    @app = app
  end

  # Set the 'Accept' header to 'application/json' no matter what.
  # Hopefully the next middleware respects the accept header :)
  def call(env)
    env['HTTP_ACCEPT'] = 'application/json'
    puts "env['HTTP_ACCEPT'] = #{env['HTTP_ACCEPT']}"
    @app.call(env) if @app
  end
end

class Timer
  def initialize(app = nil)
    @app = app
  end

  def call(env)
    before = Time.now
    status, headers, body = @app.call(env) if @app

    headers['X-Timing'] = (Time.now - before).to_i.to_s

    [status, headers, body]
  end
end

class HelloWorldApp

  def initialize(app = nil)
    @app = app
  end

  def self.call(env)
    [200, {}, ['hello world!']] 
  end
end

# put the timer at the top so it captures everything below it
app = Rack::Builder.new do 
  use Timer # put the timer at the top so it captures everything below it
  use EnsureJsonResponse
  run HelloWorldApp
end

Rack::Server.start :app => app
