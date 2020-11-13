module Types
    class AddressType < Types::BaseObject
        field :id, ID, null: false
        field :number_and_street, String, null: true
        field :suite_or_apartment, String, null: true
        field :city, String, null: true
        field :postal_code, String, null: true
        field :country, String, null: true
        
    end
end