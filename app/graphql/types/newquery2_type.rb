module Types
    class Newquery2Type < Types::BaseObject
      field :id, ID, null: false
      field :building_id, ID, null: true
      field :customer_id, ID, null: true
      field :company_name, String, null: true
      field :status, String, null: true
    end
  # end
  # class Newquery2Type < Types::BaseObject
  #   field :id, ID, null: false
  #   field :customer, CustomerType, null: false
  #   field :interventions, [InterventionType], null: false      

  # end
end
