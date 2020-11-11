# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'minitest'
task :minitest => :environment do

    #number = ExternalDB1.connection.execute("select * from customers")
    number = Customer.count
    puts number

end