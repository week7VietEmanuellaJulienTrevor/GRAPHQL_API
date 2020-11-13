module Types
    class BuildingDetailType < Types::BaseObject
        field :id, ID, null: false
        field :information_key, String, null: false
        field :value, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
        field :building_id, ID, null: false
        field :customer_id, ID, null: false
    end
end