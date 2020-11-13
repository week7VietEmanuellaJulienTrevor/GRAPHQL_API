module Types
    class Query4Type < Types::BaseObject
      field :id, ID, null: false
      # field :report, String, null: false
      # field :address, String, null: false
      # field :start_date, String, null: false
      # field :end_date, String, null: true
      field :address_of_the_building, String, null: false

    end
  end