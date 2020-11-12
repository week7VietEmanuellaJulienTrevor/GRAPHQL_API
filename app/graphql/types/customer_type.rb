module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    # field :factinterventions, [FactInterventionType], null: true
    field :customer_creation_date, GraphQL::Types::ISO8601Date, null: true
    field :company_name, String, null: true
    field :company_headquarter_address, String, null: true
    field :full_name_company_contact, String, null: true
    field :company_contact_phone, String, null: true
    field :email_company_contact, String, null: true
    field :company_description, String, null: true
    field :full_name_service_technical_authority, String, null: true
    field :technical_authority_phone, String, null: true
    field :technical_manager_email, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :admin_user_id, Integer, null: true
    field :address_id, Integer, null: true
    field :employee_id, Integer, null: true
  end
end
