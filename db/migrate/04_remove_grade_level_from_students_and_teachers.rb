class RemoveGradeLevelFromStudentsAndTeachers < ActiveRecord::Migration[6.0]

    def change
        remove_column :teachers, :grade_level
        remove_column :students, :grade_level
    end
end