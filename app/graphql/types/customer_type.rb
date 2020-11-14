module Types
    class CustomerType < Types::BaseObject
        field :id, ID, null: false 
        field :customer_creation_date, String, null: true 
        field :company_name, String, null: true
        field :company_headquarter_address, String, null: true
        field :full_name_company_contact, String, null: true
        field :company_contact_phone, String, null: true
        field :email_company_contact, String, null: true
        field :company_description, String, null: true
        field :full_name_service_technical_authority, String, null: true
        field :technical_authority_phone, String, null: true
        field :technical_manager_email, String, null: true
        field :created_at, String, null: true
        field :updated_at, String, null: true
        field :admin_user_id, ID, null: true
        field :address_id, ID, null: true
        field :employee_id, ID, null: true 
        field :buildings, [BuildingType], null: true
    end
end