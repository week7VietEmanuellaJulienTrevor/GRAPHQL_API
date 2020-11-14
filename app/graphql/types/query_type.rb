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

    field :query5, Query5Type, null: false do
      description "other test"
      argument :id, ID, required: true
    end
    
    # conn = PG::Connection.open(dbname: "datawarehouse_development")
    # FactIntervention = conn.exec('SELECT * FROM factinterventions')
    def query5 (id:)
      fc_table = Factintervention.find(id)
      # lay thong tin building_id trong dong Factintervention id =1 
      fc_employee_id = fc_table[:employee_id]
      #b_table = Building.find(fc_building_id)

      puts"-------------------------"
      puts fc_employee_id
      puts"-------------------------"
     
      fc_table2 = fc_table.attributes
      # e_employee_firstn = Employee.find(fc_employee_id)[:first_name]
      # e_employee_lastn = Employee.find(fc_employee_id)[:last_name]
      puts"-------------------------"
      puts fc_table2
      puts"-------------------------"
      # lay toan bo thong tin cua specific address_id trong table address
      a_table_entry = Employee.find(fc_employee_id)

      puts"-------------------------"
      puts a_table_entry
      puts"-------------------------"
      #tao hash Address for specific address_id
      a_table_entry2 = a_table_entry.attributes

      puts"-------------------------"
      puts a_table_entry2
      puts"-------------------------"
      # phai tao hash (".attributes") de append key ("addess") va value (truong hop nay la hash luon "a_table_entry2")
      fc_table2["employee"] = a_table_entry2

      puts"-------------------------"
      puts fc_table2
      puts"-------------------------"

      result = {
        id: id,
        interventions: fc_table2
      }
      # result = "test"
    end



    field :newquery1, Newquery1Type , null: false do
      description "first querry done"
      argument :id, ID, required: true
    end
    
    def newquery1 (id:)
      # lay thong tin toan bo Factintervention id =1 (for example)
      fc_table = Factintervention.find(id)
      # lay thong tin building_id trong dong Factintervention id =1 
      fc_building_id = fc_table[:building_id]
      #b_table = Building.find(fc_building_id)
     
      # tao hash Factintervention id =1 (for example)
      fc_table2 = fc_table.attributes

      puts"-------------------------"
      puts fc_table2
      puts"-------------------------"

      # vao table building, lay building_id de tim address_id
      b_address_id = Building.find(fc_building_id)[:address_id]
      puts b_address_id
      # lay toan bo thong tin cua specific address_id trong table address
      a_table_entry = Address.find(b_address_id)
      #tao hash Address for specific address_id
      a_table_entry2 = a_table_entry.attributes

      puts"-------------------------"
      puts a_table_entry2
      puts"-------------------------"
      # phai tao hash (".attributes") de append key ("addess") va value (truong hop nay la hash luon "a_table_entry2")
      fc_table2["address"] = a_table_entry2

      puts"-------------------------"
      puts fc_table2
      puts"-------------------------"
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
      description "second query"
      argument :id, ID, required: true
    end
    
    # def newquery2 (id:)
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
    #     id: id,
    #     customer: customer,
    #     interventions: interventions
    #   }

    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    #   pp result
    #   p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      

    #   # Building.find(id)

    #   return result
    # end

    field :newquery3, Newquery3Type, null:false do
      description "query 3"
      argument :id, ID, required: true 
    end
    def newquery3 (id:)

      employee = Employee.find(id)
      employeeHash = employee.attributes


      # gets the employee's interventions as an array
      interventions = Factintervention.where(employee_id: id)
      

      interventionid = []

      # creates an array of intervention ids
      interventions.each do |intervention|
        interventionid.push(intervention[:building_id])
      end
      # eliminate duplicates
      interventionid = interventionid.uniq

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
      
      end


      buildings = [buildinghash]

      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      # pp buildinglist
      # p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      
      employeeHash["interventions"] = listOfInterventions

      result = {
        # interventions: interventions,
        # interventions:listOfInterventions,
        # buildings: buildings
        # buildings: buildinglist
        employee: employeeHash
      }

      # return listOfInterventions
    end
  end
end
 