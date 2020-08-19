class SkillSet < ActiveRecord::Base
    has_many :user_skill_sets
    has_many :users, through: :user_skill_sets
end