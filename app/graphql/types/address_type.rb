module Types
  class AddressType < Types::BaseObject
    field :id, ID, null: false
    field :type_of_address, String, null: false
    field :status, String, null: false
    field :entity, String, null: false
    field :number_and_street, String, null: false
    field :suite_or_apartment, String, null: false
    field :city, String, null: false
    field :postal_code, String, null: false
    field :country, String, null: false
    field :notes, String, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    
  end
end
