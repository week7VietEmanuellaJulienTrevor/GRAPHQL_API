module Types
    class InterventionType < Types::BaseObject
        field :description, String, null: true
        field :id, ID, null: false
        field :start_date_intervention, String, null: false
        field :employee_id, ID, null: false
        field :building_id, ID, null: false
        field :battery_id, ID, null: true
        field :column_id, ID, null: true
        field :elevator_id, ID, null: true
        field :end_date_intervention, String, null: true
        field :result, String, null: false
        field :report, String, null: true
        field :status, String, null: false
        field :address, AddressType, null: true
        field :building, [BuildingType], null: true
        field :employee, EmployeeType, null: true

    end
end