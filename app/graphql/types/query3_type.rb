module Types
    class Query3Type < Types::BaseObject
      field :id, ID, null: false
      field :type_of_building, String, null: false
      # field :address, String, null: false
      # field :start_date, String, null: false
      # field :end_date, String, null: true
    end
  end