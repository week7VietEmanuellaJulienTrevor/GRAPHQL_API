# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'minitest'
task :minitest => :environment do

    puts "first db connection"
    number = Customer.count
    puts number

    puts "second db connection"
    conn = PG::Connection.open(dbname: "datawarehouse_development")
    fact_interventions = conn.exec('SELECT * FROM factinterventions')
    puts fact_interventions.count

end