module Types
    class Query2Type < Types::BaseObject
      field :id, ID, null: false
      field :address_of_the_building, String, null: false
      field :factinterventions, [FactInterventionType], null: true
      #field :address, String, null: false
      # field :start_date, String, null: false
      # field :end_date, String, null: true
    end
  end
  