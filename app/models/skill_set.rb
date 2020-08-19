class SkillSet < ActiveRecord::Base
    has_many :user_skill_sets
    has_many :user, through: :user_skill_sets

    def create_user_skill_set

    end

    def view_skill_set
    end
end