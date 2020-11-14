module Types
  class QueryType < Types::BaseObject


    field :newquery1, Newquery1Type , null: false do
      description "first querry done"
      argument :id, ID, required: true
    end
    
    def newquery1 (id:)
      # get the intervention from ID
      fc_table = Factintervention.find(id)
      # convert intervention to hash
      interventionR = fc_table.attributes

      # get the building ID from intervention
      fc_building_id = fc_table[:building_id]
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
      description "second query"
      argument :id, ID, required: true
    end
    
    def newquery2 (id:)
      # get the interventions using a building id
      interventions = Factintervention.where(building_id: id)
      # get the customers from the building id 
      customer = Customer.find(Building.find(id)[:customer_id])

      p"__________________________________"
      puts interventions
      p "_________________________________"
      puts customer

      
      # join the 2 collections for the final result
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
      
      employeeHash["interventions"] = listOfInterventions

      result = {
        
        employee: employeeHash
      }

    end

    # field :customerInfo, Newquery3Type, null:false do
    #   description "customer information and their products"
    #   argument :id, ID, required: true 
    # end
    # def customerInfo(id:)
    #   customer = Customer.find(id)
    #   customerHash = customer.attributes
    #   batteries

    #   batterielist = []
      


    #   customerHash
    # end
  end
end
 