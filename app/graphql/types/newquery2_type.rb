module Types
    class Newquery2Type < Types::BaseObject
      field :id, ID, null: false #building table
      field :customer_id, ID, null: false 
      field :customer_creation_date, String, null: true #customer table start
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
      field :employee_id, ID, null: true #customer table end
    end
  end