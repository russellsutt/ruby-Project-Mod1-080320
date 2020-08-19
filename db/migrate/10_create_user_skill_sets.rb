class CreateUserSkillSets < ActiveRecord::Migration[6.0]

    def change
        create_table :user_skill_sets do |t|
            t.integer :user_id
            t.integer :skill_set_id
        end
    end
end