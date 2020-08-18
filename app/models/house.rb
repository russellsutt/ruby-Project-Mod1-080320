class House < ActiveRecord::Base
    has_many :user_houses
    has_many :users,through: :user_houses
    has_one :adventure
    has_one :room
end