module Types
  class Newquery2Type < Types::BaseObject
    field :id, ID, null: true
    field :customer, CustomerType, null: false
    field :interventions, [InterventionType], null: false      
    
  end
end
