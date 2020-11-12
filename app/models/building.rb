class Building < ActiveRecord::Base
<<<<<<< HEAD
    # has_many :factinterventions
=======
    has_many :factinterventions, validate: true
>>>>>>> 5c3995650996365ad8e78bcffd802b23eb29f5a5
    # belongs_to :customer
    # has_one :building_detail
    # belongs_to :address
    # has_many :batteries
end