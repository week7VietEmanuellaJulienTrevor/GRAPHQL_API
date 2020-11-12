class Factintervention < DatawarehouseBase
    establish_connection DB2
    self.table_name = 'factinterventions'
    # belongs_to :building
    # belongs_to :employees
    # belongs_to :batteries
    # belongs_to :columns
    # belongs_to :elevators

end