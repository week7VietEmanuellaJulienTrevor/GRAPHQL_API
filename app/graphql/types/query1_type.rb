module Types
  class Query1Type < Types::BaseObject
    field :id, ID, null: false
    field :company_name, String, null: false
    # field :address, String, null: false
    # field :start_date, String, null: false
    # field :end_date, String, null: true
  end
end
