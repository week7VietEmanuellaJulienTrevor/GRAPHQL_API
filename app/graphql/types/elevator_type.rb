module Types
    class ElevatorType < Types::BaseObject
        field :id, ID, null: false
        field :serial_number, String, null: true 
        field :model, String, null: true 
        field :type_of_building, String, null: true 
        field :status, String, null: true 
        field :commissioning_date, String, null: true 
        field :last_inspection_date, String, null: true 
        field :inspection_certificate, String, null: true 
        field :information, String, null: true 
        field :notes, String, null: true 
        field :created_at, String, null: true 
        field :updated_at, String, null: true 
        field :column_id, BuildingDetailType, null: true 
        field :customer_id, String, null: true
    end
end