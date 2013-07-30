desc "run the server"
task :default do
  sh "rackup"
end

desc "run the client"
task :client do
  sh %q{curl -v 'http://localhost:9292'}
end
