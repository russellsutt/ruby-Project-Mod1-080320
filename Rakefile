require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'pry'

task :default => ["run"]

desc "Run the game"
task :run do |t|
  CLI.new.start
end

desc "Start our app console"
task :console do
  Pry.start
end
