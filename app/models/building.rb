class Building < ActiveRecord::Base
    has_many :factinterventions, validate: true
    # belongs_to :customer
    has_one :building_detail
    # belongs_to :address
    # has_many :batteries
end