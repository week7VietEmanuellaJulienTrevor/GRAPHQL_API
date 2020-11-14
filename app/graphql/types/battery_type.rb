module Types
    class BatteryType < Types::BaseObject
        field :id, ID, null: false
        field :building_id, ID, null: true
        field :type_of_building, String, null: true
        field :status, String, null: true
        field :employee_id, ID, null: true
        field :commissioning_date, String, null: true
        field :last_inspection_date, String, null: true
        field :operations_certificate, String, null: true
        field :information, String, null: true
        field :notes, String, null: true
        field :created_at, String, null: true
        field :updated_at, String, null: true
        field :customer_id, ID, null: true 
    end
end