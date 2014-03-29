# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Bookshelf::Application.load_tasks

task :default => [:ngtest, :spec]

task :ngtest do
  system("cd ngapp; grunt test")
end

task :prod do
  system("cd ngapp; npm install -g bower grunt-cli; npm install; bower install; grunt build --force")
end