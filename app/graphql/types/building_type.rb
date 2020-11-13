module Types
    class BuildingType < Types::BaseObject
        field :id, ID,
        field :address_of_the_building, String, null: false
        field :full_name_of_the_building_administrator, String, null: false
        field :email_of_the_administrator_of_the_building, String, null: false
        field :phone_number_of_the_building_administrator, String, null: false
        field :full_name_of_the_technical_contact_for_the_building, String, null: false
        field :technical_contact_email_for_the_building, String, null: false
        field :technical_contact_phone_for_the_building, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
        field :customer_id, String, null: false
        field :address_id, String, null: false
        field :building_details, BuildingDetailsType, null: false 
    end
end