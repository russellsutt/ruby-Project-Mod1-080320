class House < ActiveRecord::Base
    has_many :characters
    has_one :adventure
    has_one :room
    has_one :library
    belongs_to :user
end