require 'pg'

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # field :query1,
    #   Query1Type, 
    #   null: false,
    #   description: "test"
    # end 
    field :query1, Query1Type, null: false do
      description "other test"
      argument :id, ID, required: true
    end
    
    def query1 (id:)
      Customer.find(id)
    end

    field :query2, Query2Type, null: false do
      description "other test"
      argument :id, ID, required: true
    end
    
    def query2 (id:)
      Building.select('buildings.id, buildings.address_of_the_building').find(id)
    end

    field :query3, Query3Type, null: false do
      description "other test"
      argument :id, ID, required: true
    end
    
    def query3 (id:)
      Battery.find(id)
    end

    field :query4, Query4Type, null: false do
      description "other test"
      argument :id, ID, required: true
    end
    
    # conn = PG::Connection.open(dbname: "datawarehouse_development")
    # FactIntervention = conn.exec('SELECT * FROM factinterventions')
    def query4 (id:)
      Factintervention.find(id)
    end
    # conn.finish()

    field :newquery1, Newquery1Type , null: false do
      description "fact intervention"
      argument :id, ID, required: true
    end
    
    # def newquery1 (id:)
    #   #Factintervention.find(id)
    #   Building.select('buildings.id, buildings.address_of_the_building, factinterventions.id, factinterventions.start_date_intervention, factinterventions.end_date_intervention').joins(:factinterventions).find(id)
    # end

    def newquery1 (id:)
      fc_table = Factintervention.find(id)
      puts"--------------"
      puts fc_table
      puts"--------------"
      puts"--------------"
      puts fc_table.attributes
      puts"--------------"
      puts"--------------"
      puts fc_table.inspect
      puts"--------------"
      fc_building_id = fc_table[:building_id]
      puts"--------------"
      puts fc_building_id
      puts"--------------"
      #b_table = Building.find(fc_building_id)
      b_address = Building.find(fc_building_id)[:address_of_the_building]
      puts"--------------"
      puts b_address
      puts"--------------"
      
      
      fc_table2 = fc_table.attributes
      puts"--------------"
      puts fc_table2
      puts"--------------"
      fc_table2["address_of_the_building"] = b_address
      puts"--------------"
      puts fc_table2
      puts"--------------"
      
      #Building.select('buildings.id, buildings.address_of_the_building, factinterventions.id, factinterventions.start_date_intervention, factinterventions.end_date_intervention').joins(:factinterventions).find(id)
      fc_table2
    end

    field :newquery2, Newquery2Type , null: false do
      description "customer_factintervention"
      argument :id, ID, required: true
    end
    
    def newquery2 (id:)
      table1 = Factintervention.find(id)
      buildingid = table1[:building_id]
      custid = Building.find(buildingid)[:customer_id]
      custinfo = Customer.find(custid)[:company_name]
      table2 = table1.attributes
      table2["company_name"] = custinfo
      table2
    end

    field :newquery3, Newquery3Type , null: false do
      description "customer_factintervention"
      argument :id, ID, required: true
    end
    
    def newquery3 (id:)
      table1 = Customer.find(id)
      employeeid = table1[:employee_id]
      puts "------employeeid----------"
      puts employeeid
      puts "----------------"
      interventionid = Factintervention.find(employee_id=employeeid)[:id]
      puts "---------interventionid-------"
      puts interventionid
      puts "----------------"
      buildingid = Factintervention.find(interventionid)[:building_id]
      puts "---------buildingid-------"
      puts buildingid
      puts "----------------"
      status = Factintervention.find(interventionid)[:status]
      table2 = table1.attributes
      table2["building_id"] = buildingid
      table2["status"] = status
      table2
    end


  end
end
 