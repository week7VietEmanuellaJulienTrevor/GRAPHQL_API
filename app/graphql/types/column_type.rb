module Types
    class ColumnType < Types::BaseObject
        field :id, ID, null: false
        field :type_of_building, String, null: true
        field :number_of_floors_served, Integer, null: true
        field :status, String, null: true
        field :information, String, null: true
        field :notes, String, null: true
        field :created_at, String, null: true
        field :updated_at, String, null: true
        field :battery_id, ID, null: true 
        field :customer_id, ID, null: true 
        field :elevators, [ElevatorType], null: true
    end
end