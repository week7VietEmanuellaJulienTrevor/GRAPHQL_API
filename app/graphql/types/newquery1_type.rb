module Types
    class Newquery1Type < Types::BaseObject
      field :id, ID, null: false
      field :building_id, ID, null: false
      field :start_date_intervention, String, null: false
      field :end_date_intervention, String, null: true
      field :address_of_the_building, String, null: false
    end
  end