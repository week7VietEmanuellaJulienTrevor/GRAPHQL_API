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

      testvariable = 31

      testvariable *= 2
      
      puts "________________________________"
      p testvariable



      Building.find(id)[:address_of_the_building]
    end
    # conn.finish()

    field :newquery1, Newquery1Type , null: false do
      description "first querry done"
      argument :id, ID, required: true
    end
    
    def newquery1 (id:)
      fc_table = Factintervention.find(id)
      fc_building_id = fc_table[:building_id]
      #b_table = Building.find(fc_building_id)
      b_address = Building.find(fc_building_id)[:address_of_the_building]
      puts b_address
      
      
      fc_table2 = fc_table.attributes
      fc_table2["address_of_the_building"] = b_address
      puts fc_table2

      
      #Building.select('buildings.id, buildings.address_of_the_building, factinterventions.id, factinterventions.start_date_intervention, factinterventions.end_date_intervention').joins(:factinterventions).find(id)
      fc_table2
    end

    field :newquery2, Newquery2Type , null: false do
      description "second query"
      argument :id, ID, required: true
    end
    
    def newquery2 (id:)

      interventions = Factintervention.where(building_id: id)
      customer = Customer.find(Building.find(id)[:customer_id])

      p"__________________________________"
      puts interventions
      p "___________________________________"
      puts customer

      result = {
        customer: customer,
        interventions: interventions
      }

      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      pp result
      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      

      # Building.find(id)

      return result
    end

    field :newquery3, Newquery3Type, null:false do
      description "query 3"
      argument :id, ID, required: true 
    end
    def newquery3 (id:)

      interventions = Factintervention.where(employee_id: id)
      interventionid = interventions.select(:building_id).distinct
      
      # buildings = Building.where(id: interventions.select(:building_id).distinct)
      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      pp interventionid
      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


      # building_details = BuildingDetail.where(id: buildings.select(:building_details_id).distinct)

      result = {
        interventions: interventions,
        # buildings: buildings
      }

    end

    

    
    
      
  

    # ------------Attempt Julien query2 def content with loop start-------------
    # b_table_entry = Building.find(id)
    # b_customer_id = b_table_entry[:customer_id]
    
    # # puts b_customer_id
    # c_table_entry = Customer.find(b_customer_id)
    # c_table_entry2 = c_table_entry.attributes
    # c_table_entry2.delete("id")

    # c_table_entry2["id"] = id
    # c_table_entry2["customer_id"] = b_customer_id
    # puts "----------------------------"
    # #puts c_table_entry2

    # c_table_entry3 = c_table_entry2
    # fc_concerned_interventions = Factintervention.where(building_id: id)
    # puts "----------)))))------------------"
    # counter = 1
    # fc_concerned_interventions.each do |f|
    #   puts f[:id]
    #   actual_id = f[:id]
    #   puts fc_concerned_interventions.where(id: actual_id)
    #   actual_intervention = Factintervention.find(actual_id)
    #   actual_intervention_hash = actual_intervention.attributes

    #   c_table_entry3["intervention#{counter}"] = actual_intervention_hash
    # end
    # #puts Factintervention.count
    # puts"999999999999999999999999999"
    # puts c_table_entry3
    # c_table_entry2
    # ------------Attempt Julien query2 def content with loop end-------------


  end
end
 