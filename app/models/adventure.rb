class Adventure < ActiveRecord::Base
    belongs_to :house
    has_many :items
end