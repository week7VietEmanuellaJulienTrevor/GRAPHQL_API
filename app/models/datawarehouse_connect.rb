class DatawarehouseConnect < ActiveRecord::Base
    self.abstract_class = true
    establish_connection :datawarehouse_connect
  end