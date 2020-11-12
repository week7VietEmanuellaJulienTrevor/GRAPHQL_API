module Types
  class BuildingType < Types::BaseObject
    field :id, ID, null: false
    field :address_of_the_building, String, null: true
    field :full_name_of_the_building_administrator, String, null: true
    field :email_of_the_administrator_of_the_building, String, null: true
    field :phone_number_of_the_building_administrator, String, null: true
    field :full_name_of_the_technical_contact_for_the_building, String, null: true
    field :technical_contact_email_for_the_building, String, null: true
    field :technical_contact_phone_for_the_building, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :customer_id, Integer, null: true
    field :address_id, Integer, null: true
   field :factinterventions, [FactInterventionType], null: false
  end
end
