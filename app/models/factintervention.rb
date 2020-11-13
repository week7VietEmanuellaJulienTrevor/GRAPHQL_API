class Factintervention < DatawarehouseBase
    belongs_to :building, validate: true
    # belongs_to :employees
    # belongs_to :batteries
    # belongs_to :columns
    # belongs_to :elevators
end