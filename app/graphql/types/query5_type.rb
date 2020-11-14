module Types
    class Query5Type < Types::BaseObject
      field :id, ID, null: false
      field :interventions, InterventionType, null: false
    end
end