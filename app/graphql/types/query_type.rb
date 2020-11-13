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

      fc_table2 = fc_table.attributes

      b_address_id = Building.find(fc_building_id)[:address_id]
      puts b_address_id
      a_table_entry = Address.find(b_address_id)
      a_table_entry2 = a_table_entry.attributes

      fc_table2["address"] = a_table_entry2
      #fc_table2["address_of_the_building"] = b_address
      #puts fc_table2
      result = {
        id: id,
        interventions: fc_table2
      }

      result
      #Building.select('buildings.id, buildings.address_of_the_building, factinterventions.id, factinterventions.start_date_intervention, factinterventions.end_date_intervention').joins(:factinterventions).find(id)
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
      interventionid = Factintervention.where(employee_id: employeeid)
      puts "---------interventionid-------"
      puts interventionid
      puts "----------------"
      # buildingid = Factintervention.find(interventionid)[:building_id]
      buildingid = Factintervention.find(3)[:building_id]
      puts "---------buildingid-------"
      puts buildingid
      puts "----------------"
      status = Factintervention.find(interventionid)[:status]
      table2 = table1.attributes
      table2["building_id"] = buildingid
      table2["status"] = status
      table2
    end

    field :newquery5, Newquery5Type , null: false do
      description "second query"
      argument :id, ID, required: true
    end

    def newquery5 (id:)

      interventions = Factintervention.where(building_id: id)
      
      customer = Customer.find(Building.find(id)[:customer_id])

      p"__________________________________"
      puts interventions
      p "___________________________________"
      puts customer

      result = {
        id: id,
        customer: customer,
        interventions: interventions
      }

      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      pp result
      p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      

      # Building.find(id)

      return result
    end

    #   # get the interventions using a building id
    #   interventions = Factintervention.where(building_id: id)
    #   # get the customers from the building id 
    #   customer = Customer.find(Building.find(id)[:customer_id])

    #   p"__________________________________"
    #   puts interventions
    #   p "___________________________________"
    #   puts customer

      
    #   # join the 2 collections for the final result
    #   result = {
    #     customer: customer,
    #     interventions: interventions
    #   }

    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #   pp result
    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      
      employee = Employee.find(id)
      employeeHash = employee.attributes


      # gets the employee's interventions as an array
      interventions = Factintervention.where(employee_id: id)
      

      interventionid = []

    #   # Building.find(id)

    #   return result
    # end

    # field :newquery3, Newquery3Type, null:false do
    #   description "query 3"
    #   argument :id, ID, required: true 
    # end
    # def newquery3 (id:)


    #   # gets the employee's interventions
    #   interventions = Factintervention.where(employee_id: id)
    #   interventionid = []

    #   # creates an array of intervention ids
    #   interventions.each do |intervention|
    #     interventionid.push(intervention[:building_id])
    #   end
    #   # eliminate duplicates
    #   interventionid = interventionid.uniq

    #   # test to join building detail to a single building
    #   building = Building.find(10)
    #   building_detail = Building_detail.where(building_id: building.id).take
    #   buildinghash = building.attributes
    #   buildinghash["building_detail"] = building_detail    
    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #   pp buildinghash
    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

      
    #   # creates an array of buildings having been intervened by employee
    #   buildings = Building.where(id: interventionid)

    #   buildinglist = []
    #   # populate the array of buildings for final result, joining them with their individual building details.
    #   buildings.each do |build|
    #     build_detail = Building_detail.where(building_id: build.id).take
    #     buildhash = build.attributes
    #     buildhash["building_detail"] = build_detail
    #     buildinglist.push(build)
    #   # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #   # pp buildhash
    #   # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      listOfInterventions = []

      interventions.each do |interventionM|

        inter = interventionM
        # convert intervention to hash
        intervention = inter.attributes

        p "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
        pp intervention["building_id"]
        p "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
  
        
        # create an empty array of buildings
        listOfBuildings = []

        # get an array of buidlings
        interventionBuildings = Building.where(id: intervention["building_id"])
        

        # add building details to each building
        interventionBuildings.each do |building|

          p "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii___________________"
          pp building["id"]
          p "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii___________________"
  

          # get the specific building's details
          detail = BuildingDetail.where(building_id: building["id"]).take
          # convert building to hash
          buildingHash = building.attributes

    

          # add details to the building
          buildingHash["building_detail"] = detail
          buildingHash["description"] = "Building"

          p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          pp buildingHash
          p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


          # push buikding to the array of buildings
          listOfBuildings.push(buildingHash)

          p"ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttytytttttgjknksafaksjfnaksskdjc"
          pp listOfBuildings
          p"ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttytytttttgjknksafaksjfnaksskdjc"


        end
        intervention["building"] = listOfBuildings
        intervention["description"] = "intervention"

        # add interventionto list of interventions
        listOfInterventions.push(intervention)


        
      end



      # test to join building detail to a single building
      building = Building.find(10)
      building_detail = BuildingDetail.where(building_id: building.id).take
      buildinghash = building.attributes
      buildinghash["building_detail"] = building_detail    
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      # pp buildinghash
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

      
      # creates an array of buildings having been intervened by employee
      buildings = Building.where(id: interventionid)

      buildinglist = []
      # populate the array of buildings for final result, joining them with their individual building details.
      buildings.each do |build|
        build_detail = BuildingDetail.where(building_id: build.id).take
        buildhash = build.attributes
        buildhash["building_detail"] = build_detail
        buildinglist.push(buildhash)
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      # pp buildhash
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
    #   end


    #   buildings = [buildinghash]

    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #   pp buildinglist
    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      # pp buildinglist
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      employeeHash["interventions"] = listOfInterventions

    #   result = {
    #     interventions: interventions,
    #     buildings: buildings
    #     # buildings: buildinglist
    #   }

    # end
      result = {
        # interventions: interventions,
        # interventions:listOfInterventions,
        # buildings: buildings
        # buildings: buildinglist
        employee: employeeHash
      }

      # return listOfInterventions
    end


    
    
      
  

    # # ------------Attempt Julien query2 def content with loop start-------------
    # # b_table_entry = Building.find(id)
    # # b_customer_id = b_table_entry[:customer_id]
    
    # # # puts b_customer_id
    # # c_table_entry = Customer.find(b_customer_id)
    # # c_table_entry2 = c_table_entry.attributes
    # # c_table_entry2.delete("id")

    # # c_table_entry2["id"] = id
    # # c_table_entry2["customer_id"] = b_customer_id
    # # puts "----------------------------"
    # # #puts c_table_entry2

    # # c_table_entry3 = c_table_entry2
    # # fc_concerned_interventions = Factintervention.where(building_id: id)
    # # puts "----------)))))------------------"
    # # counter = 1
    # # fc_concerned_interventions.each do |f|
    # #   puts f[:id]
    # #   actual_id = f[:id]
    # #   puts fc_concerned_interventions.where(id: actual_id)
    # #   actual_intervention = Factintervention.find(actual_id)
    # #   actual_intervention_hash = actual_intervention.attributes

    # #   c_table_entry3["intervention#{counter}"] = actual_intervention_hash
    # # end
    # # #puts Factintervention.count
    # # puts"999999999999999999999999999"
    # # puts c_table_entry3
    # # c_table_entry2
    # # ------------Attempt Julien query2 def content with loop end-------------


  end
end
 