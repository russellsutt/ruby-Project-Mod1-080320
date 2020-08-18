class House < ActiveRecord::Base
    has_many :characters
    has_one :adventure
    has_one :room
end