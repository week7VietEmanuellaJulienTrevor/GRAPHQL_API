module Types
    class DatacityType < Types::BaseObject
        field :elevator_number, Integer, null: true
        field :column_number, Integer, null: true
        field :battery_number, Integer, null: true    
        field :building_number, Integer, null: true  

    end
end