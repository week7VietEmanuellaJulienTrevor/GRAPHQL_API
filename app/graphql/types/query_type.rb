require 'pg'
require "st-elsewhere"

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
      #Factintervention.find(id)
      Building
      .select('buildings.id, buildings.address_of_the_building, factinterventions.id, factinterventions.start_date_intervention, factinterventions.end_date_intervention')
      .joins(:factinterventions).find(id)
    end


  end
end
