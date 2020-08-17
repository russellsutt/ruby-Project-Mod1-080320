class Teacher < ActiveRecord::Base
    has_many :grade_levels
    has_many :students, through: :grade_levels

    def tenure
        if self.years_of_experience > 5
            return true
        else
            return false
        end
    end
end