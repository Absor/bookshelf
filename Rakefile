# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Bookshelf::Application.load_tasks

task :travis => [:ngtest, :spec]
task :test => [:ngtest, :ngbuild, :spec]

task :ngtest do
  system("cd ngapp; grunt test") or exit!(1)
end

task :ngbuild do
  system("cd ngapp; grunt build") or exit!(1)
end

task 'test:prepare'