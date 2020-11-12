# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'minitest'
task :minitest => :environment do

    puts "first db connection"
    number = Customer.find(1)[:company_name]
    puts number
    #puts Customer.all

    # puts "second db connection"
    #Test jd db ok!
    # conn = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", user: "codeboxx", password: "Codeboxx1!", dbname: "jd2")
    # fact = conn.exec('SELECT * FROM fact_elevators')

    #conn = PG::Connection.open(dbname: "datawarehouse_development")
    #fact = conn.exec('SELECT * FROM factinterventions')
    # puts fact.count
    
    # puts "second db connection +++"
    # puts Factintervention.count


end