desc "run the server"
task :default do
  sh "ruby hello_world.rb"
end

desc "run the client"
task :client do
  sh %q{curl -v 'http://localhost:8080?message="hello%20world"'}
end
