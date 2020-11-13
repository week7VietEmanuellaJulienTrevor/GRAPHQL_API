module Types
    class Newquery5Type < Types::BaseObject
      field :id, ID, null: true
      field :customer, CustomerType, null: true
      field :interventions, [InterventionType], null: true     
  
    end
  end