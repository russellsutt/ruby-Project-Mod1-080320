class Library < ActiveRecord::Base
    belongs_to :house
    has_many :user_libraries
    has_many :users, through: :user_libraries
end

