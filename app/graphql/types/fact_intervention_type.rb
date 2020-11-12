module Types
  class FactInterventionType < Types::BaseObject
     field :id, ID, null: false
      field :employee_ID, ID, null: false
      field :building_id, ID, null: false
      field :battery_id, Int, null: true
      field :column_id, Int, null: true
      field :elevator_ID, Int, null: true
      field :start_date_intervention, String, null: false
      field :end_date_intervention, String, null: true
      field :address_of_the_building, String, null: false
      field :result, String, null: false
      field :report, String, null: true
      field :status, String, null: false
      # employee
      field :employee, Types::EmployeeType, null: true

      field :building, Types::BuildingType, null: true

      
  end
end

def building
  Building.where(id: object.building_id)[0]
end
  
def Employee 
  Employee.where(id: object.employee_id)[0]
end
