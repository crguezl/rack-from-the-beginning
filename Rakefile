desc "run the server"
task :default do
  sh "rackup"
end

desc "run the server hello_world.rb"
task :server do
  sh "ruby hello_world.rb"
end

desc "run the client"
task :client do
  sh %q{curl -v 'http://localhost:9292'}
end

desc "run the client for hello_world"
task :client2 do
  sh %q{curl -v 'http://localhost:8080'}
end
