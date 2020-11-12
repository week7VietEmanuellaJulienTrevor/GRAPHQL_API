module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :title, String, null: true
    field :email, String, null: true
    field :factinterventions, [FactInterventionType], null: false
  end
end
