module Types
    class Extraquery1Type < Types::BaseObject
      field :customers, [CustomerType], null: true
      field :employees, [EmployeeType], null: true     
      
    end
  end