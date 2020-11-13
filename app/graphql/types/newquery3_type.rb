module Types
    class Newquery3Type < Types::BaseObject
        field :interventions, [InterventionType], null:false
        field :employee, EmployeeType, null:false
        field :buildings, [BuildingType], null:false
        
        
    end
end