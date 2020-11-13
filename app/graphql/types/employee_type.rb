module Types
    class EmployeeType < Types::BaseObject
        field :id, ID, null: false
        field :first_name, String, null: false
        field :last_name, String, null: false
        field :title, String, null: false
        field :email, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false
        field :admin_user_id, ID, null: false
        field :phone_number, ID, null: false
        field :interventions, [InterventionType], null: true
    end
end