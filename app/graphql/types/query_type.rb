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
      b_table_entry = Building.find(id)
      b_customer_id = b_table_entry[:customer_id]
      
      # puts b_customer_id
      c_table_entry = Customer.find(b_customer_id)
      c_table_entry2 = c_table_entry.attributes
      c_table_entry2.delete("id")

      c_table_entry2["id"] = id
      c_table_entry2["customer_id"] = b_customer_id
      puts "----------------------------"
      #puts c_table_entry2

      fc_concerned_interventions = Factintervention.where(building_id: id)
      puts "----------------------------"
      puts fc_concerned_interventions.all

      fc_concerned_interventions_count = fc_concerned_interventions.count
      puts "----------------------------"
      fc_concerned_interventions_id = fc_concerned_interventions.first[:id]
      puts fc_concerned_interventions_id
      element1 = fc_concerned_interventions.find(fc_concerned_interventions_id)
      element1_hash = element1.attributes
      puts element1_hash
      #fc_concerned_interventions.find(fc_concerned_interventions_id).destroy
      puts fc_concerned_interventions.count
      

      c_table_entry2
    end

    
   

     field :Factintervention, FactInterventionType, null: false do
      argument :id, ID, required: true

    end
    def Factintervention (id:)
      Factintervention.find(id)
    end
    
    #  employees
    field :Employees, [Types::EmployeeType], null: true
    
    def Employees
      Employee.all
    end
    field :Employee, Types::EmployeeType, null: false do
      argument :id, ID, required: true
    end

    def Employee(id:)
      Employee.find(id)
    end


      field :buildings, [Types::BuildingType], null: true
    
    def building
      Building.all
    end
    field :building, Types::BuildingType, null: false do
      argument :id, ID, required: true
    end

    def building(id:)
      Building.find(id)
    end

   
    #  field :building, BuildingType, null: false do
    #   argument :id, ID, required: true
    # end
    # def building(id:)
    #   building.select('buildings.id, buildings.address_of_the_building').find(id)
    
    # end
  end
end
 